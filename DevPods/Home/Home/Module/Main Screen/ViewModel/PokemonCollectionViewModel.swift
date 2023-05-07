//
//  PokemonCollectionViewModel.swift
//  Home
//
//  Created by Car mudi on 07/02/23.
//

import Common
import RxSwift
import RxCocoa

final class PokemonCollectionViewModel {
    
    typealias GetPokemonImage = AnyUseCase<UIImage, Int>
    
    // MARK: - Public properties
    
    var isLoadingObservable: Observable<Bool> {
        isLoading.asObservable()
    }
    
    var imageObservable: Observable<UIImage> {
        image.asObservable().filterNil()
    }
    
    var pokemonNameObservable: Observable<String> {
        pokemonName.asObservable().ifEmpty(default: "-")
    }
    
    public let isLoading = BehaviorRelay<Bool>(value: false)
    
    // MARK: - Private Properties
    
    private let bundle = Bundle(for: PokemonCollectionViewModel.self).resource
    
    private let getPokemonImage: GetPokemonImage
    
    private let image = BehaviorRelay<UIImage?>(value: nil)
    private let pokemonName = BehaviorRelay<String>(value: "")
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialized
    
    init(
        pokemonName: String,
        getPokemonImage: GetPokemonImage = AnyUseCase(GetPokemonImageUseCase.make())
    ) {
        self.getPokemonImage = getPokemonImage
        self.pokemonName.accept(pokemonName)
    }
    
    // MARK: - Private methods
    
    func getImage(id: Int) {
        isLoading.accept(true)
        getPokemonImage.execute(with: id)
            .observe(on: MainScheduler.instance)
            .withUnretainedObject(self)
            .subscribe(
                onSuccess: { (viewModel, image) in
                    viewModel.isLoading.accept(false)
                    viewModel.image.accept(image)
            },
                onFailure: { [weak self] _ in
                    let imageError = UIImage(named: "iconImageError", in: self?.bundle, compatibleWith: nil)
                    self?.image.accept(imageError)
                    self?.isLoading.accept(false)
            })
            .disposed(by: disposeBag)
    }
    
}
