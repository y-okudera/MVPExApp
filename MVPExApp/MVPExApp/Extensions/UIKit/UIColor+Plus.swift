//
//  UIColor+Plus.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/19.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import UIKit

extension UIColor {

    func getRGBA()->(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat){
      var red:CGFloat = 0
      var green:CGFloat = 0
      var blue:CGFloat = 0
      var alpha:CGFloat = 0
      self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
      return (r: red, g: green, b: blue, a: alpha)
    }

    static func + (left: UIColor, right: UIColor) -> UIColor {
      let c1 = left.getRGBA()
      let c2 = right.getRGBA()
      let r = max(0.0, min(1.0, c1.r + c2.r))
      let g = max(0.0, min(1.0, c1.g + c2.g))
      let b = max(0.0, min(1.0, c1.b + c2.b))
      let a = max(0.0, min(1.0, c1.a + c2.a))
      return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
