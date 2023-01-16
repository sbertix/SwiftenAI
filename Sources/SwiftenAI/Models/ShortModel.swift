//
//  ShortModel.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 10/01/23.
//

import Foundation

/// A `struct` defining a short notation for model isntances.
public struct ShortModel: RawRepresentable, Identifiable {
    /// The underlying raw value.
    public let rawValue: String
    /// The model identifier.
    public var id: String { rawValue }

    /// Init.
    ///
    /// - parameter rawValue: The model identifier.
    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Compose using `Codex`.
    ///
    /// - parameter codex: Some valid `Codex`.
    /// - returns: A `ShortModel`.
    public static func codex(_ codex: Codex) -> Self {
        .init(rawValue: codex.rawValue)
    }

    /// Compose using `GPT3`.
    ///
    /// - parameter gpt3: Some valid `GPT3`.
    /// - returns: A `ShortModel`.
    public static func gpt3(_ gpt3: GPT3) -> Self {
        .init(rawValue: gpt3.rawValue)
    }
}

extension ShortModel: ExpressibleByStringLiteral {
    /// Init through a string literal.
    ///
    /// - parameter value: Some `StringLiteralType`.
    public init(stringLiteral value: StringLiteralType) {
        self.init(rawValue: value)
    }
}

public extension ShortModel {
    /// An `enum` listing available `Codex` models.
    enum Codex: String {
        /// Almost as capable as Davinci Codex, but slightly faster.
        /// This speed advantage may make it preferable for real-time
        /// applications.
        case cushman = "code-cushman-001"
        /// Most capable Codex model. Particularly good at translating
        /// natural language to code. In addition to completing code,
        /// also supports inserting completions within code.
        case davinci = "code-davinci-002"
    }

    /// An `enum` listing available `GPT3` models.
    enum GPT3: String {
        /// Capable of very simple tasks, usually the fastest model
        /// in the GPT-3 series, and lowest cost.
        case ada = "text-ada-001"
        /// Capable of straightforward tasks, very fast, and lower cost.
        case babbage = "text-babbage-001"
        /// Very capable, but faster and lower cost than Davinci.
        case curie = "text-curie-001"
        /// Most capable GPT-3 model. Can do any task the other models
        /// can do, often with higher quality, longer output and better
        /// instruction-following. Also supports inserting completions within text.
        case davinci = "text-davinci-003"
    }
}
