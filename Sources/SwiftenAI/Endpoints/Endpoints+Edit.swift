//
//  Endpoints+Edit.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 09/01/23.
//

import Foundation

import Requests

public extension Endpoints {
    /// A `struct` defining properties
    /// for completion-specific endpoints.
    struct Edit: Encodable {
        /// ID of the model to use.
        /// You can use the List models API to see all of your available models,
        /// or see our Model overview for descriptions of them.
        ///
        /// - warning: Not all models can be used here.
        public var model: String = "text-davinci-edit-001"

        /// The input text to use as a starting point for the edit.
        public var input: String

        /// The instruction that tells the model how to edit the prompt.
        public var instruction: String

        /// What sampling temperature to use. Higher values means the model
        /// will take more risks. Try 0.9 for more creative applications, and 0
        /// (argmax sampling) for ones with a well-defined answer.
        ///
        /// We generally recommend altering this or `topP` but not both.
        public var temperature: Double = 1

        /// An alternative to sampling with temperature, called nucleus sampling,
        /// where the model considers the results of the tokens with `topP`
        /// probability mass. So 0.1 means only the tokens comprising the top
        ///  10% probability mass are considered.
        ///
        /// We generally recommend altering this or temperature but not both.
        public var topP: Double = 1

        /// How many edits to generate for each prompt.
        ///
        /// Because this parameter generates many completions,
        /// it can quickly consume your token quota. Use carefully
        /// and ensure that you have reasonable settings for
        /// `maxTokens` and `stop`.
        public var n: Int = 1

        /// Init.
        ///
        /// - parameters:
        ///     - model: The model.
        ///     - input: The input text.
        ///     - instruction: The instruction text.
        ///     - temperature: The sampling temperature. Defaults to `1`.
        ///     - topP: The nucleus sampling top-P value. Defaults to `1`.
        ///     - n: The number of completions to generate. Defaults to `1`.
        public init(
            model: ShortModel = "text-davinci-edit-001",
            input: String,
            instruction: String,
            temperature: Double = 1,
            topP: Double = 1,
            n: Int = 1
        ) {
            self.model = model.id
            self.input = input
            self.instruction = instruction
            self.temperature = temperature
            self.topP = topP
            self.n = n
        }
    }
}

public extension Endpoints.Edit {
    /// Request to create and edit.
    ///
    /// - returns: Some locked `SingleEndpoint`.
    func process() -> Providers.Lock<Secret, AnySingleEndpoint<Responses.Edit>> {
        .init { secret in
            Single {
                Method(.post)
                Path("https://api.openai.com/v1/edits")
                Headers(secret.headers)
                Headers("application/json", forKey: "Content-Type")
                Body(self, encoder: .default)
                Response(Responses.Edit.self, decoder: .default)
            }.eraseToAnySingleEndpoint()
        }
    }
}
