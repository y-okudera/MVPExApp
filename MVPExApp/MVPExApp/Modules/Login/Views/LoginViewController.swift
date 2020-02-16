//
//  LoginViewController.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    // クラスではなく、プロトコルを指定
    var presenter: LoginPresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(debug: "")
    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        hideIndicatorAlert()
//    }

    @IBAction private func tappedLoginButton(_ sender: UIButton) {
        presenter.tappedLoginButton(userId: "user_id", password: "password")
    }
}

extension LoginViewController: LoginView {
    
    func showIndicator() {
        showIndicatorAlert(message: "ログイン中")
    }

    func hideIndicator() {
        hideIndicatorAlert()
    }
    
    func showAlert(title: String, message: String) {
        hideIndicatorAlert { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
}
