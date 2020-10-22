//
//  PokemonListItem.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import Foundation

struct PokemonListItem: Codable {
    let name: String
    let url: String
}

extension PokemonListItem: Identifiable {
    var id: UUID { return UUID() }
}
