//
//  PokemonFavoriteObservableUseCase.swift
//  Network
//
//  Created by Car mudi on 09/02/23.
//

//import Common
//import Foundation
//import RxSwift
//
//public final class PokemonFavoriteObservableUseCase: ObservableUseCase {
//    
//    // MARK: - Private Properties
//    
//    private let repository: PokemonFavoriteLocalDataSource
//    
//    // MARK: - Initialization
//    
//    init(repository: PokemonFavoriteLocalDataSource = PokemonFavoriteLocalDataSourceImpl()) {
//        self.repository = repository
//    }
//    
//    // MARK: - Public Methods
//    
//    public static func make() -> PokemonFavoriteObservableUseCase {
//        PokemonFavoriteObservableUseCase()
//    }
//    
//    public func observe(with initialParameters: Void) -> Observable<<#Response Model#>> {
//        repository.<#Method Name#>
//    }
//    
//    public func send(_ parameter: Void) {
//        repository.<#Action Method#>
//    }
//}
