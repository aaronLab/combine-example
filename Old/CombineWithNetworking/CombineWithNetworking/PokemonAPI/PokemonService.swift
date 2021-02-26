//
//  APIService.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import Foundation
import Combine

protocol PokemonService {
    var apiSession: APIService { get }

    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError>
}

extension PokemonService {

    func getPokemonList() -> AnyPublisher<PokemonListAPIResponse, APIError> {
        return apiSession.request(with: PokemonEndpoint.pokemonList)
            .eraseToAnyPublisher()
    }

}
