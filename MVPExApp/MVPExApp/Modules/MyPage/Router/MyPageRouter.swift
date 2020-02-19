//
//  MyPageRouter.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

final class MyPageRouter {
    
    private weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    class func assembleModules() -> UIViewController {

        let view: MyPageViewController = .instantiate()

        let model: MyPageModelInput = MyPageModel()

        let router = MyPageRouter(viewController: view)
        let presenter = MyPagePresenter(view: view, model: model, router: router)

        view.presenter = presenter
        model.output = presenter

        return view
    }
}

extension MyPageRouter: MyPageWireframe {

}
