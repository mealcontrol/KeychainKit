//
//  CFUtils.swift
//  KeychainKit
//
//  Created by Maxim Krouk on 2/17/20.
//

import Security

extension CFString {
    var string: String {
        String(describing: self)
    }
}

extension Bool {
    var cfBoolean: CFBoolean { self ? kCFBooleanTrue : kCFBooleanFalse }
}
