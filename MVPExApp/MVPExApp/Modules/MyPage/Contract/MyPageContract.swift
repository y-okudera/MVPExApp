//
//  MyPageContract.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/16.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

// MARK: - マイページ画面のプロトコル定義

protocol MyPageView: class {

}

protocol MyPagePresentable {

}

protocol MyPageModelInput: class {
    var output: MyPageModelOutput? { get set }

}

protocol MyPageModelOutput: class {
    
}

protocol MyPageWireframe {
    
}
