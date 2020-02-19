//
//  LoginPresenter.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

final class LoginPresenter {
    
    private weak var view: LoginView?
    private let model: LoginModelInput
    private let router: LoginWireframe
    
    init(view: LoginView, model: LoginModelInput, router: LoginWireframe) {
        self.view = view
        self.model = model
        self.router = router
        
        self.model.output = self
    }
}

// MARK: - ビューからの通知
extension LoginPresenter: LoginPresentable {
    func tappedLoginButton(userId: String, password: String) {
        view?.showIndicator()
        model.requestLogin(userId: userId, password: password)
    }
}

// MARK: - モデルからの通知
extension LoginPresenter: LoginModelOutput {
    
    func loginResult(result: LoginResult) {
        
        switch result {
        case .success(let response):
            print(debug: "ログイン成功")
            dump(debug: response)
            DispatchQueue.mainSyncSafe {
                view?.hideIndicator { [weak self] in
                    self?.router.showMyPage()
                }
            }
            
        case .failure(let error):
            print(debug: error)
            DispatchQueue.mainSyncSafe {
                view?.showAlert(title: "", message: "ログインに失敗しました。")
            }
        }
    }
}
