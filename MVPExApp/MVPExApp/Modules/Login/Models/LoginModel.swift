//
//  LoginModel.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

enum LoginError: Error {
    case invalidURL
    case clientError(urlError: URLError)
    case serverError(statusCode: Int)
    case noResponse
    case decodeError(Error)
    case error(Error)
}

enum LoginResult {
    case success(LoginResponse)
    case failure(LoginError)
}

final class LoginModel {
    weak var output: LoginModelOutput?
}

extension LoginModel: LoginModelInput {

    /// APIリクエスト
    func requestLogin(userId: String, password: String) {

        let baseURL = "https://5e197941cc623b00146787f3.mockapi.io/api/v1"
        let path = "/login"
        guard let url = URL(string: baseURL + path) else {
            assertionFailure("URL is nil.")
            output?.loginResult(result: .failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            guard let `self` = self else {
                print(debug: "LoginModel was released.")
                return
            }

            // error check
            if let error = error {
                print(debug: "client error: \(error.localizedDescription)")

                if let urlError = error as? URLError {
                    self.output?.loginResult(result: .failure(.clientError(urlError: urlError)))
                } else {
                    self.output?.loginResult(result: .failure(.error(error)))
                }
                return
            }

            // data and response check
            guard let data = data, let response = response as? HTTPURLResponse else {
                print(debug: "No data or no response.")
                self.output?.loginResult(result: .failure(.noResponse))
                return
            }

            if case 200..<300 = response.statusCode {
                print(debug: "data: \(data)")
                guard let loginResponse = self.decode(decodeType: LoginResponse.self, data: data) else {
                    return
                }
                self.output?.loginResult(result: .success(loginResponse))
            } else {
                // レスポンスのステータスコードが200~300でない場合はサーバエラーとしてハンドリング
                print(debug: "Server error. http status code: \(response.statusCode)")
                self.output?.loginResult(result: .failure(.serverError(statusCode: response.statusCode)))
            }
        }
        task.resume()
    }

    private func decode<T: Decodable>(decodeType: T.Type, data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let decodedObject = try decoder.decode(decodeType, from: data)
            return decodedObject

        } catch {
            print(debug: "decodingError: \(error)")
            output?.loginResult(result: .failure(.decodeError(error)))
            return nil
        }
    }
}

// MARK: - Mock class

final class LoginModelMock {
    weak var output: LoginModelOutput?
}

extension LoginModelMock: LoginModelInput {

    /// Bundle内のlogin.json読み込み
    func requestLogin(userId: String, password: String) {

        let loginResponse = JSONFileReader(jsonFileName: "login.json", decodeType: LoginResponse.self)

        loginResponse.decode { result in
            switch result {
            case .success(let response):
                output?.loginResult(result: .success(response))
            case .failure(let error):
                output?.loginResult(result: .failure(.error(error)))
            }
        }
    }
}
