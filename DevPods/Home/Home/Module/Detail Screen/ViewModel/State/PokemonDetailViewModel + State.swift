//
//  PokemonDetailViewModel + State.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

import Common

extension PokemonDetailViewModel {
    enum State: ViewModelState {
        case goBack
        case initial(PokemonDetailResponseModel)
        case configureNavigationBar(String, UIImage? = nil)
        case setPokemonImage(UIImage)
    }
}
