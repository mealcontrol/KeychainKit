//
//  NSLock+Extension.swift
//  KeychainKit
//
//  Created by Maxim Krouk on 2/17/20.
//

import Foundation

extension NSLock {
    func execute<T>(closure: () -> T) -> T {
        lock(); defer { unlock() }
        return closure()
    }
}
