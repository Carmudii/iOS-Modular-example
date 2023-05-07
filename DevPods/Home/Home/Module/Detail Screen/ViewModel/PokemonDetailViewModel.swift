//
//  PokemonDetailViewModel.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

import Common
import RxSwift
import RxCocoa

final class PokemonDetailViewModel {
    
    typealias GetPokemonDetail = AnyUseCase<PokemonDetailResponseModel, Int>
    
    // MARK: - Private Properties
    
    private let getPokemonDetail: GetPokemonDetail
    private let pokemonId: Int
    private let pokemonViewModel: PokemonCollectionViewModel
    
    private let mutableState = BehaviorRelay<State?>(value: nil)
    private let disposeBag = DisposeBag()
    
    // MARK: - Initialized
    
    public init(
        pokemonId: Int,
        with viewModel: PokemonCollectionViewModel,
        getPokemonDetail: GetPokemonDetail = AnyUseCase(GetPokemonDetailUseCase.make())
    ) {
        self.pokemonId = pokemonId
        self.pokemonViewModel = viewModel
        self.getPokemonDetail = getPokemonDetail        
    }
    
    // MARK: - Private methods
    
    private func viewDidLoad() {
        retrivePokemonDetail(with: pokemonId)
        
        bindPokemonName()
        bindImage()
    }
    
    private func retrivePokemonDetail(with pokemonId: Int) {
        getPokemonDetail.execute(with: pokemonId)
            .observe(on: MainScheduler.instance)
            .withUnretainedObject(self)
            .subscribe(
                onSuccess: { (viewModel, response) in
                    viewModel.mutableState.accept(.initial(response))
                },
                onFailure: { error in
                    print("DEBUG -> error \(error)")
                }
            )
            .disposed(by: disposeBag)
    }
    
    private func bindImage() {
        pokemonViewModel.imageObservable
            .withUnretainedObject(self)
            .subscribe(onNext: { (viewModel, pokemonImage) in
                viewModel.mutableState.accept(.setPokemonImage(pokemonImage))
            })
            .disposed(by: disposeBag)
    }
    
    private func bindPokemonName() {
        pokemonViewModel.pokemonNameObservable
            .withUnretainedObject(self)
            .subscribe(onNext: { (viewModel, pokemonName) in
                viewModel.mutableState.accept(.configureNavigationBar(pokemonName))
            })
            .disposed(by: disposeBag)
    }
    
}

extension PokemonDetailViewModel: ViewModel {
    
    var state: Observable<State> {
        mutableState.asObservable().filterNil()
    }
    
    func onReceiveEvent(_ event: Event) {
        
        switch event {
        case .goBack:
            mutableState.accept(.goBack)
            
        case .viewDidLoad:
            viewDidLoad()
        }
    }
}


