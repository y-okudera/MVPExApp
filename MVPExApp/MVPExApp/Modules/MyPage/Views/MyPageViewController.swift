//
//  MyPageViewController.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/16.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

final class MyPageViewController: UIViewController {

    var presenter: MyPagePresentable!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension MyPageViewController: MyPageView {

}
