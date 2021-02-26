//
//  PokemonListViewModel.swift
//  CombineWithNetworking
//
//  Created by Aaron Lee on 2020-10-22.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject, PokemonService {
    var apiSession: APIService
    @Published var pokemon = [PokemonListItem]()
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getPokemonList() {
        let cancellable = self.getPokemonList()
            .sink { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { pokemon in
                self.pokemon = pokemon.results
            }
        cancellables.insert(cancellable)
    }
    
}
