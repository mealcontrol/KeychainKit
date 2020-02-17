//
//  Coding.swift
//  KeychainKit
//
//  Created by Maxim Krouk on 2/18/20.
//

import Foundation

public protocol DataDecoder {
    func decode<T>(_ type: T.Type, from: Data) throws -> T where T : Decodable
}

public protocol DataEncoder {
    func encode<T>(_ value: T) throws -> Data where T : Encodable
}

extension JSONDecoder: DataDecoder {}
extension JSONEncoder: DataEncoder {}

extension Result where Success == Data {
    
    func decode<T>(_ type: T.Type, using decoder: DataDecoder = JSONDecoder()) -> Result<T, Error>
    where T: Decodable {
        switch self {
        case .success(let data):
            do { return try .success(decoder.decode(T.self, from: data)) }
            catch { return .failure(error) }
        case .failure(let error):
            return .failure(error)
        }
    }
    
}

extension Encodable {
    func encode(using encoder: DataEncoder = JSONEncoder()) -> Result<Data, Error> {
        do { return try .success(encoder.encode(self)) }
        catch { return .failure(error) }
    }
}
