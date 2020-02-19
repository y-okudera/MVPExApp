//
//  UIView+Gradient.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/19.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

extension UIView {

    /// グラデーション
    ///
    /// - Parameters:
    ///   - startPoint: グラデーションの開始位置
    ///   - endPoint: グラデーションの終了位置
    ///   - colors: グラデーションのカラー配列
    func gradient(startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
                  endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0),
                  colors: [CGColor]) {

        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.colors = colors
        layer.insertSublayer(gradient, at: 0)
    }
}
