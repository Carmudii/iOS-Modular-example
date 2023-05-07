//
//  PokemonListRepositoryImpl.swift
//  Pods
//
//  Created by Car mudi on 06/02/23.
//

import RxSwift
import Moya

final class PokemonListRepositoryImpl: PokemonListRepository {
    
    private let provider: MoyaProvider<PokemonListEndPoint>
    private let decoder: JSONDecoder
    
    init(
        provider: MoyaProvider<PokemonListEndPoint> = .defaultProvider(),
        decoder: JSONDecoder = .default
    ) {
        self.provider = provider
        self.decoder = decoder
    }
    
    // MARK: - Public methods
    
    func getPokemonList(offset: Int, limit: Int) -> Single<PokemonListResponseModel> {
        return provider.requestWithValidation(.getPokemonList(offset: offset, limit: limit))
            .map(PokemonListResponseModel.self, using: decoder)
    }
    
    func getPokemonImage(id: Int) -> Single<UIImage> {
        return provider.requestWithValidation(.getPokemonImage(id: id))
            .mapImage()
    }
}

extension PokemonListRepositoryImpl {
    enum PokemonListRepositoryError: Error {
        case cantLoadImage
    }
}
