//
//  PokemonListRepository.swift
//  Pods
//
//  Created by Car mudi on 06/02/23.
//

import UIKit
import RxSwift

protocol PokemonListRepository {
    func getPokemonList(offset: Int, limit: Int) -> Single<PokemonListResponseModel>
    func getPokemonImage(id: Int) -> Single<UIImage>
}
