//
//  String+Localized.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/20.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
