//
//  JSONEncoder.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 16/01/23.
//

import Foundation

extension JSONEncoder {
    /// The default encoder for `SwiftenAI`.
    static var `default`: JSONEncoder {
        let encoder: JSONEncoder = .init()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
}
