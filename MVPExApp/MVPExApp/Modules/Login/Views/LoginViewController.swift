//
//  LoginViewController.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet private weak var userNameOrMailField: UITextField! {
        didSet {
            userNameOrMailField.delegate = self
        }
    }
    @IBOutlet private weak var passwordField: UITextField! {
        didSet {
            passwordField.delegate = self
        }
    }
    
    // クラスではなく、プロトコルを指定
    var presenter: LoginPresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(debug: "")

        let colors = [UIColor.systemTeal.withAlphaComponent(0.5),
                      UIColor.systemPurple.withAlphaComponent(0.25),
                      UIColor.systemPink.withAlphaComponent(0.5)].map { $0.cgColor }
        self.view.gradient(colors: colors)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.gradientLayer?.frame = self.view.bounds
    }

    @IBAction private func tappedLoginButton(_ sender: UIButton) {
        let userNameOrMail = userNameOrMailField.text ?? ""
        let password = passwordField.text ?? ""
        presenter.tappedLoginButton(userNameOrMail: userNameOrMail, password: password)
    }
}

extension LoginViewController: LoginView {
    
    func showIndicator() {
        showIndicatorAlert(message: "ログイン中".localized)
    }

    func hideIndicator(completion: (() -> Void)?) {
        hideIndicatorAlert(completion: completion)
    }
    
    func showAlert(title: String, message: String) {
        hideIndicatorAlert { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if ObjectIdentifier(textField) == ObjectIdentifier(userNameOrMailField) {
            passwordField.becomeFirstResponder()
        } else if ObjectIdentifier(textField) == ObjectIdentifier(passwordField) {
            textField.resignFirstResponder()
        }
        return true
    }
}
