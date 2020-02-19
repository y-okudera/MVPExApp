//
//  LoginRouter.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

final class LoginRouter {

    private weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    class func assembleModules() -> UIViewController {

        let loginView: LoginViewController = .instantiate()

        // ローカルのJSONファイルから情報を取得する場合は、ここをMockに変更するだけ
        let loginModel: LoginModelInput = LoginModel()
//        let loginModel: LoginModelInput = LoginModelMock()

        let router = LoginRouter(viewController: loginView)
        let presenter = LoginPresenter(view: loginView, model: loginModel, router: router)

        loginView.presenter = presenter
        loginModel.output = presenter

        return loginView
    }
}

extension LoginRouter: LoginWireframe {
    
    func showMyPage() {
        print(debug: "ログイン画面からマイページ画面に遷移")
        let myPage = MyPageRouter.assembleModules()
        viewController?.navigationController?.pushViewController(myPage, animated: true)
    }
}
