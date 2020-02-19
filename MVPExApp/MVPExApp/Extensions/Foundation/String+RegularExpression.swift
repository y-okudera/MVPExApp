//
//  String+RegularExpression.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/20.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

infix operator =~

private func =~(lhs: String, rhs: String) -> Bool {
    
    do {
        let regex = try NSRegularExpression(pattern: rhs)
        let range = NSRange(location: 0, length: lhs.count)
        let numberOfMatches = regex.numberOfMatches(in: lhs, range: range)
        return numberOfMatches > 0
    } catch {
        return false
    }
}

extension String {
    
    /// 半角英数記号のみか(半角スペース以外)
    ///
    /// 空文字はNG
    func isOnlyAlphanumericAndSymbols() -> Bool {
        return self =~ "^[ -~&&[^ ]]+$"
    }
}
