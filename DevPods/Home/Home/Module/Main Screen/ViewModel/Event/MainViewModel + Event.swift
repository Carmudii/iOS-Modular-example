//
//  MainViewModel + Event.swift
//  Feature A
//
//  Created by Car mudi on 01/02/23.
//

import Common

extension MainViewModel {
    public enum Event: ViewModelEvent {
        case loadList(limit: Int = 20)
        case showPokemonDetail(pokemonId: Int, with: PokemonCollectionViewModel)
    }
}
