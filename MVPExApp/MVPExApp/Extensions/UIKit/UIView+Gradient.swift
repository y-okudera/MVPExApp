//
//  UIView+Gradient.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/19.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

var gradientLayerKey: UInt8 = 0

extension UIView {

    var gradientLayer: CAGradientLayer? {
        get {
            return (objc_getAssociatedObject(self, &gradientLayerKey) ?? 0) as? CAGradientLayer
        }
        set {
            objc_setAssociatedObject(self, &gradientLayerKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

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

        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = bounds
        gradientLayer?.startPoint = startPoint
        gradientLayer?.endPoint = endPoint
        gradientLayer?.colors = colors
        if let gradientLayer = self.gradientLayer {
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
