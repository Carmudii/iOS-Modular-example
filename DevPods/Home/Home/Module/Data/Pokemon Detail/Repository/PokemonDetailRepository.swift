//
//  PokemonDetailRepository.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

import RxSwift

protocol PokemonDetailRepository {
    func getDetail(pokemonId: Int) -> Single<PokemonDetailResponseModel>
}
