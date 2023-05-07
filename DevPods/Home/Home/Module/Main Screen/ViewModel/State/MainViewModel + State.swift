//
//  MainViewModel + State.swift
//  Feature A
//
//  Created by Car mudi on 01/02/23.
//

import Common

extension MainViewModel {
    public enum State: ViewModelState {
        case initial(data: [PokemonCollectionViewModel])
        case navigateToPokemonDetailScreen(pokemonId: Int, with: PokemonCollectionViewModel)
    }
}
