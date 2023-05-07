//
//  PokemonListUseCase.swift
//  Home
//
//  Created by Car mudi on 07/02/23.
//

import Common
import Foundation
import RxSwift

public struct PokemonListUseCase: UseCase {
    
    // MARK: - Private Properties
    
    private let repository: PokemonListRepository
    
    // MARK: - Initialization
    
    init(
        repository: PokemonListRepository = PokemonListRepositoryImpl()
    ) {
        self.repository = repository
    }
    
    // MARK: - Public Methods
    
    public static func make() -> PokemonListUseCase {
        PokemonListUseCase()
    }
    
    public func execute(with parameter: Parameter) -> Single<PokemonListResponseModel> {
        repository.getPokemonList(offset: parameter.offset, limit: parameter.limit)
    }
    
    // MARK - Private methods
    
}

extension PokemonListUseCase {
    public struct Parameter {
        var offset: Int
        var limit: Int
        
        public init(offset: Int, limit: Int) {
            self.offset = offset
            self.limit = limit
        }
    }
}
