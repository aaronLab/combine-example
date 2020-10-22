//
//  PokemonEndpoint.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import Foundation

enum PokemonEndpoint {
    case pokemonList
}

extension PokemonEndpoint: RequestBuilder {

    var urlRequest: URLRequest {
        switch self {
        case .pokemonList:
            guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon")
                else { preconditionFailure("Inavlid URL") }
            
            let request = URLRequest(url: url)
            return request
        }
    }
}
