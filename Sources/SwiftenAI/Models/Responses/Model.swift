//
//  Model.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 09/01/23.
//

import Foundation

import Requests

/// A `struct` defining a model instance.
public struct Model: Identifiable, CustomDebugStringConvertible {
    /// The decoded object.
    public let decoded: AnyDecodable

    /// The model identifier.
    public var id: String { decoded.id.string! } // swiftlint:disable:this force_unwrapping
    /// The owner.
    public var owner: String? { decoded.ownedBy.string }

    /// The debug description.
    public var debugDescription: String {
        "Model(id: \"\(id)\", owner: \(String(reflecting: owner))"
    }

    /// Init.
    ///
    /// - parameter decoded: The underlying decoded object.
    public init?(decoded: AnyDecodable) {
        let decoded = decoded.fromSnakeCase()
        guard decoded.id.string != nil else { return nil }
        self.decoded = decoded
    }
}
