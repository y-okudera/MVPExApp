//
//  LoginViewMock.swift
//  MVPExAppTests
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

@testable import MVPExApp
import UIKit

final class LoginViewMock: UIViewController, LoginView {

    var presenter: LoginPresentable!

    var tappedLoginButton_call_count = 0
    var showIndicator_call_count = 0
    var hideIndicator_call_count = 0
    var showAlert_call_count = 0

    func tappedLoginButton() {
        self.tappedLoginButton_call_count += 1
        presenter.tappedLoginButton(userId: "", password: "")
    }

    func showIndicator() {
        self.showIndicator_call_count += 1
    }

    func hideIndicator() {
        self.hideIndicator_call_count += 1
    }

    func showAlert(title: String, message: String) {
        self.showAlert_call_count += 1
    }
}
