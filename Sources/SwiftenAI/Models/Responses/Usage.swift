//
//  Usage.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 16/01/23.
//

import Foundation

public extension Responses {
    /// A `struct` holding reference to
    /// a generic `Usage` response.
    struct Usage: Decodable, Equatable {
        /// Number of tokens used on the prompt.
        public let promptTokens: Int
        /// Number of tokens used on the completion.
        public let completionTokens: Int
        /// Number of total tokens.
        public let totalTokens: Int
    }
}

extension Responses.Usage: Comparable {
    /// Sort by total tokens used.
    ///
    /// - parameters:
    ///     - lhs: Some `Usage`.
    ///     - rhs: Some `Usage`.
    /// - returns: A valid `Bool`.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.totalTokens < rhs.totalTokens
    }
}
