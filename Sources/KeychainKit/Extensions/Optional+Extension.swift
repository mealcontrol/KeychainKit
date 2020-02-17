//
//  Optional+Extension.swift
//  KeychainKit
//
//  Created by Maxim Krouk on 2/18/20.
//

extension Optional {
    func or(_ defaultValue: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? defaultValue()
    }
}
