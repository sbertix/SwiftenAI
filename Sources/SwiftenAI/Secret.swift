//
//  Secret.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 09/01/23.
//

import Foundation

/// A `struct` defining the secret used
/// to authenticate API requests.
public struct Secret: Codable, Equatable {
    /// The API key.
    public let key: String
    /// An optional organization key.
    public let organization: String?

    /// The request headers.
    @_spi(Private)
    public var headers: [String: String] {
        ["Authorization": "Bearer \(key)",
         "OpenAI-Organization": organization]
            .compactMapValues { $0 }
    }

    /// Init.
    ///
    /// - parameters:
    ///     - key: The API key.
    ///     - organization: An optional organization key. Defaults to `nil`.
    public init(key: String, organization: String? = nil) {
        self.key = key
        self.organization = organization
    }
}
