//
//  JSONFileReader.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

enum JSONFileReaderError: Error {
    case jsonFileNotFound
    case decodingError(Error)
    case others(Error)
}

final class JSONFileReader<T: Decodable> {
    
    private let jsonFileName: String
    private let decodeType: T.Type
    
    /// イニシャライザ
    /// - Parameters:
    ///   - jsonFileName: JSONファイル名
    ///   - decodeType: Decodable Type
    init(jsonFileName: String, decodeType: T.Type) {
        self.jsonFileName = jsonFileName
        self.decodeType = decodeType
    }
    
    /// デコードする
    func decode(handler: (Result<T, JSONFileReaderError>) -> ()) {
        do {
            let name = jsonFileName.deletingPathExtension
            let type = jsonFileName.pathExtension
            let bundle = Bundle(for: JSONFileReader<T>.self)
            guard let jsonFilePath = bundle.path(forResource: name, ofType: type) else {
                handler(.failure(.jsonFileNotFound))
                return
            }
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            let jsonData = try Data(contentsOf: jsonFileURL)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedObject = try decoder.decode(decodeType, from: jsonData)
            handler(.success(decodedObject))
            
        } catch let decodingError as DecodingError {
            print("[\(#function):\(#line)]decodingError: \(decodingError)")
            handler(.failure(.decodingError(decodingError)))
        } catch let error {
            print("[\(#function):\(#line)]error: \(error)")
            handler(.failure(.others(error)))
        }
    }
}
