//
//  Endpoints+Model.swift
//  SwiftenAI
//
//  Created by Stefano Bertagno on 09/01/23.
//

import Foundation

import Requests

public extension Endpoints {
    /// A `typealias` for `ShortModel`.
    typealias Model = ShortModel
}

public extension Endpoints.Model {
    /// Fetch all available models.
    static var allCases: Providers.Lock<Secret, AnySingleEndpoint<[Model]>> {
        .init { secret in
            Single {
                Path("https://api.openai.com/v1/models")
                Headers(secret.headers)
                Response(AnyDecodable.self)
                Response<AnyDecodable, _> { $0.data.array?.compactMap(Model.init) ?? [] }
            }.eraseToAnySingleEndpoint()
        }
    }

    /// Fetch info for the current model.
    var summary: Providers.Lock<Secret, AnySingleEndpoint<Model?>> {
        .init { secret in
            Single {
                Path("https://api.openai.com/v1/models")
                Path(id)
                Headers(secret.headers)
                Response(AnyDecodable.self)
                Response(Model.init)
            }.eraseToAnySingleEndpoint()
        }
    }
}
