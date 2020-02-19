//
//  LoginModelMock.swift
//  MVPExAppTests
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

@testable import MVPExApp
import Foundation

final class LoginModelMock {
    weak var output: LoginModelOutput?

    var requestLogin_call_count = 0
}

extension LoginModelMock: LoginModelInput {

    func confirmUserNameAndPassword(userNameOrMail: String, password: String) {
        self.output?.confirmResult(result: .success(userNameOrMail: userNameOrMail, password: password))
    }
    
    /// Bundle内のlogin.json読み込み
    func requestLogin(userNameOrMail: String, password: String) {
        
        requestLogin_call_count += 1
        
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
