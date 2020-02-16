//
//  MyPagePresenter.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/17.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

final class MyPagePresenter {

    private weak var view: MyPageView?
    private let model: MyPageModelInput
    private let router: MyPageWireframe

    init(view: MyPageView, model: MyPageModelInput, router: MyPageWireframe) {
        self.view = view
        self.model = model
        self.router = router

        self.model.output = self
    }
}

extension MyPagePresenter: MyPagePresentable {

}

extension MyPagePresenter: MyPageModelOutput {
    
}
