//
//  Result+Extension.swift
//  KeychainKit
//
//  Created by Maxim Krouk on 2/18/20.
//

extension Result {
    var value: Success? { try? get() }
}
