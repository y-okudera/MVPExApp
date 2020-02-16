//
//  LoginRouterMock.swift
//  MVPExAppTests
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

@testable import MVPExApp
import UIKit

final class LoginRouterMock: LoginWireframe {

    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    var showMyPage_call_count = 0

    func showMyPage() {
        showMyPage_call_count += 1
    }
}
