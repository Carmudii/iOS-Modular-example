//
//  PokemonDetailRepositoryImpl.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

import Network
import RxSwift
import Moya

final class PokemonDetailRepositoryImpl: PokemonDetailRepository {
    
    private let provider: MoyaProvider<PokemonDetailEndPoint>
    private let decoder: JSONDecoder
    
    init(
        provider: MoyaProvider<PokemonDetailEndPoint> = .defaultProvider(),
        decoder: JSONDecoder = .default
        
    ) {
        self.provider = provider
        self.decoder = decoder
    }
    
    // MARK: - Public methods
    
    func getDetail(pokemonId: Int) -> Single<PokemonDetailResponseModel> {
        return provider.requestWithValidation(.getDetail(pokemonId: pokemonId))
            .map(PokemonDetailResponseModel.self, using: decoder)
    }
}
