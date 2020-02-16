//
//  String+Path.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

extension String {
    
    private var ns: NSString {
        return (self as NSString)
    }
    
    /// 拡張子を取得する
    var pathExtension: String {
        return ns.pathExtension
    }
    
    /// 拡張子を削除する
    var deletingPathExtension: String {
        return ns.deletingPathExtension
    }
}
