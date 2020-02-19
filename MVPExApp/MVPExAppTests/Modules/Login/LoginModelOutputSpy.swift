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
    var view: LoginView?
    var model: LoginModelInput?

    init(view: LoginView?, model: LoginModelInput?) {
        self.view = view
        self.model = model
    }

    func confirmResult(result: LoginInputResult) {
        switch result {
        case .success(let userNameOrMail, let password):
            view?.showIndicator()
            model?.requestLogin(userNameOrMail: userNameOrMail, password: password)
        case .failure(let error):
            view?.showAlert(title: "", message: error.message)
        }
    }

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
