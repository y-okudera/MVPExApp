//
//  LoginResponse.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/07.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Foundation

/// ログインAPIのレスポンス
struct LoginResponse: Decodable {
    
    /// "OK" or "NG"
    var result: String?
    
    /// NGの場合、nil
    var userData: UserData?
}

struct UserData: Decodable {
    var userId: String?
    var userName: String?
    var sessionToken: String?
    var lastLoginDate: String?
}
