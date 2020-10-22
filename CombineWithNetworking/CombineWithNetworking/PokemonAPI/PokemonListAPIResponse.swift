//
//  PokemonListAPIResponse.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import Foundation

struct PokemonListAPIResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonListItem]
}
