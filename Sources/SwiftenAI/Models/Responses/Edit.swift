//
//  Edit.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 16/01/23.
//

import Foundation

public extension Responses {
    /// A `struct` holding reference to
    /// an `Edit` response.
    struct Edit: Decodable {
        /// The creation date.
        public let created: Date
        /// Available choices.
        public let choices: [Choice]
        /// Token usage.
        public let usage: Usage
    }
}

public extension Responses.Edit {
    /// A `struct` defining the actual
    /// response.
    struct Choice: Decodable, Equatable {
        /// The index of the response.
        public let index: Int
        /// The actual edit.
        public let text: String
    }
}

extension Responses.Edit.Choice: Comparable {
    /// Sort by index.
    ///
    /// - parameters:
    ///     - lhs: Some `Edit.Choice`.
    ///     - rhs: Some `Edit.Choice`.
    /// - returns: A valid `Bool`.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.index < rhs.index
    }
}
