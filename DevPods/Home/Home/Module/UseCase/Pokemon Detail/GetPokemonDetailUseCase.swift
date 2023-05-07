//
//  GetPokemonDetailUseCase.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

import Common
import Foundation
import RxSwift

public struct GetPokemonDetailUseCase: UseCase {
    
    // MARK: - Private Properties
    
    private let repository: PokemonDetailRepository
    
    // MARK: - Initialization
    
    init(
        repository: PokemonDetailRepository = PokemonDetailRepositoryImpl()
    ) {
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    public static func make() -> GetPokemonDetailUseCase {
        GetPokemonDetailUseCase()
    }
    
    public func execute(with parameter: Int) -> Single<PokemonDetailResponseModel> {
        repository.getDetail(pokemonId: parameter)
    }
}
