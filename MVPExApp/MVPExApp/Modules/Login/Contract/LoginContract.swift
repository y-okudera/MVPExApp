//
//  LoginContract.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

// MARK: - ログイン画面のプロトコル定義

/// Presenter -> View
///
/// ビューへの更新依頼を定義
protocol LoginView: class {
    func showIndicator()
    func hideIndicator(completion: (() -> Void)?)
    func showAlert(title: String, message: String)
}

/// View -> Presenter
///
/// プレゼンターへの処理依頼を定義
protocol LoginPresentable {
    func tappedLoginButton(userId: String, password: String)
}

/// Presenter -> Model
///
/// モデルへの処理依頼を定義
protocol LoginModelInput: class {
    var output: LoginModelOutput? { get set }
    func requestLogin(userId: String, password: String)
}

/// Model -> Presenter
///
/// プレゼンターへの処理結果通知を定義
protocol LoginModelOutput: class {
    func loginResult(result: LoginResult)
}

/// Presenter -> Router
///
/// ルーターへの画面遷移依頼を定義
protocol LoginWireframe {
    func showMyPage()
}
