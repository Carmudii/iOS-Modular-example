//
//  PokemonFavoriteModel.swift
//  Network
//
//  Created by Car mudi on 09/02/23.
//

public struct PokemonFavoriteModel: Equatable {
    public let pokemonId: Int
    public let isFavorite: Bool
    
    public init(
        pokemonId: Int,
        isFavorite: Bool
    ) {
        self.pokemonId = pokemonId
        self.isFavorite = isFavorite
    }
}
