//
//  JSONDecoder.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 16/01/23.
//

import Foundation

extension JSONDecoder {
    /// The default decoder for `SwiftenAI`.
    static var `default`: JSONDecoder {
        let decoder: JSONDecoder = .init()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
