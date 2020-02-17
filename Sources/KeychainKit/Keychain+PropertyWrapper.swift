//
//  Keychain+PropertyWrapper.swift
//  KeychainKit
//
//  Created by Maxim Krouk on 2/17/20.
//

import Foundation

@propertyWrapper
public struct KeychainManaged<Object: Codable> {
    private let key: String
    private let defaultValue: Object
    private let encoder: DataEncoder
    private let decoder: DataDecoder
    private var keychain: Keychain
    
    public init(key: String,
                default defaultValue: Object,
                keychain: Keychain = .default,
                encoder: DataEncoder = JSONEncoder(),
                decoder: DataDecoder = JSONDecoder()) {
        self.key = key
        self.defaultValue = defaultValue
        self.keychain = keychain
        self.encoder = encoder
        self.decoder = decoder
    }
    
    public var wrappedValue: Object {
        get {
            return keychain
                .getData(forKey: key)
                .decode(Object.self, using: decoder)
                .value.or(defaultValue)
        }
        set {
            guard let data = try? newValue.encode(using: encoder).get() else { return }
            keychain.setData(data, forKey: key)
        }
    }
}
