//
//  Keychain+Result.swift
//  Convenience
//
//  Created by Maxim Krouk on 8/4/19.
//

import Foundation
import Security

public extension Keychain {
    
    struct OperationResult {
        /// Result code. Equal to noErr (0) if operation succeed.
        var code: OSStatus
        
        /// Creates a new instance.
        ///
        /// - Parameter code: Result code, noErr (0) by default.
        init(code: OSStatus = noErr) {
            self.code = code
        }
        
        var isSuccess: Bool { code == noErr }
        var result: Result<Void, Swift.Error> {
            isSuccess ?
                .success(()) :
                .failure(Error.osError(code))
        }
    }
    
}

