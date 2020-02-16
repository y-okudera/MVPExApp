//
//  DispatchQueue+MainSyncSafe.swift
//  MVPExApp
//
//  Created by Yuki Okudera on 2020/02/13.
//  Copyright © 2020 Yuki Okudera. All rights reserved.
//

import Dispatch
import Foundation

extension DispatchQueue {
    class func mainSyncSafe(execute work: () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.sync(execute: work)
        }
    }

    class func mainSyncSafe<T>(execute work: () throws -> T) rethrows -> T {
        if Thread.isMainThread {
            return try work()
        } else {
            return try DispatchQueue.main.sync(execute: work)
        }
    }
}
