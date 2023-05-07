//
//  GetPokemonImageUseCase.swift
//  Home
//
//  Created by Car mudi on 07/02/23.
//

import Common
import Foundation
import RxSwift

public struct GetPokemonImageUseCase: UseCase {
    
    // MARK: - Private Properties
    
    private let repository: PokemonListRepository
    
    // MARK: - Initialization
    
    init(
        repository: PokemonListRepository = PokemonListRepositoryImpl()
    ) {
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    public static func make() -> GetPokemonImageUseCase {
        GetPokemonImageUseCase()
    }
    
    public func execute(with parameter: Int) -> Single<UIImage> {
        repository.getPokemonImage(id: parameter)
    }
}
