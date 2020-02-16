//
//  LoginPresenterTests.swift
//  MVPExAppTests
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

@testable import MVPExApp
import XCTest

class LoginPresenterTests: XCTestCase {

    let view = LoginViewMock()
    let model = LoginModelMock()
    var router: LoginRouterMock?
    var presenter: LoginPresenter?

    var outputSpy = LoginModelOutputSpy()

    override func setUp() {
        
        router = LoginRouterMock(viewController: view)
        presenter = LoginPresenter(view: view, model: model, router: router!)

        view.presenter = presenter
        model.output = outputSpy
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() {
        let expect = expectation(description: "login test")

        outputSpy.expectation = expect

        // execute
        view.tappedLoginButton()

        // verify
        XCTAssertEqual(view.tappedLoginButton_call_count, 1)
        XCTAssertEqual(view.showIndicator_call_count, 1)
        XCTAssertEqual(view.hideIndicator_call_count, 0)
        XCTAssertEqual(view.showAlert_call_count, 0)

        XCTAssertEqual(model.requestLogin_call_count, 1)
        XCTAssertEqual(router?.showMyPage_call_count, 0)

        wait(for: [expect], timeout: 3.0)
    }
}
