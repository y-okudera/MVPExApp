//
//  LoginModelOutputSpy.swift
//  MVPExAppTests
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

@testable import MVPExApp
import XCTest

final class LoginModelOutputSpy: LoginModelOutput {

    var expectation: XCTestExpectation?

    func loginResult(result: LoginResult) {

        switch result {
        case .success(let response):
            XCTAssertEqual(response.result, "OK")
            XCTAssertNotNil(response.userData)
            
        case .failure(let error):
            XCTAssert(false, "ログイン失敗:\(error.localizedDescription)")
        }

        expectation?.fulfill()
    }
}
