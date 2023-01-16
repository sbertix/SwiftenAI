//
//  Completion.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 16/01/23.
//

import Foundation

public extension Responses {
    /// A `struct` holding reference to
    /// a `Completion` response.
    struct Completion: Decodable, Identifiable {
        /// The identifier.
        public let id: String
        /// The creation date.
        public let created: Date
        /// The model identifier.
        public let model: String
        /// Available choices.
        public let choices: [Choice]
        /// Token usage.
        public let usage: Usage
    }
}

public extension Responses.Completion {
    /// A `struct` defining the actual
    /// response.
    struct Choice: Decodable, Equatable {
        /// The index.
        public let index: Int
        /// The actual completion.
        public let text: String
        /// The log prob, if it exists.
        public let logprobs: Int?
        /// The finish reason.
        public let finishReason: String
    }
}
