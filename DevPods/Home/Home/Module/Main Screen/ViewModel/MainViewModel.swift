//
//  MainViewModel.swift
//  Feature A
//
//  Created by Car mudi on 01/02/23.
//

import Common
import RxSwift
import RxCocoa

final class MainViewModel {

    typealias Parameter = PokemonListUseCase.Parameter
    typealias GetPokemonListUseCase = AnyUseCase<PokemonListResponseModel, Parameter>

    // MARK: - Private Properties

    private let getPokemonListUseCase: GetPokemonListUseCase

    private let mutableState = BehaviorRelay<State?>(value: nil)
    private let disposeBag = DisposeBag()
    
    private var pokemonList: [PokemonCollectionViewModel] = [PokemonCollectionViewModel]()
    private var offset: Int = 0

    // MARK: - Initialized

    public init(
        getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase(PokemonListUseCase.make())
    ) {
        self.getPokemonListUseCase = getPokemonListUseCase
    }

    // MARK: - Private methods

    private func getPokemonList(limit: Int) {
        
        let parameter = Parameter(offset: offset, limit: limit)

        getPokemonListUseCase.execute(with: parameter)
            .observe(on: MainScheduler.instance)
            .withUnretainedObject(self)
            .subscribe(onSuccess: { (viewModel, response) in
                
                viewModel.pokemonList += response.results.map {
                    PokemonCollectionViewModel(pokemonName: $0.name)
                }
                
                for i in viewModel.offset...viewModel.pokemonList.count - 1 {
                    viewModel.pokemonList[i].getImage(id: i+1)
                }
                
                viewModel.mutableState.accept(.initial(data: viewModel.pokemonList))
                
                if response.next != nil {
                    viewModel.offset += 20
                }
            }, onFailure: { error in
                print("DEBUG -> \(error)")
            })
            .disposed(by: disposeBag)
    }
}

extension MainViewModel: ViewModel {

    var state: Observable<State> {
        mutableState.asObservable().filterNil()
    }

    func onReceiveEvent(_ event: Event) {

        switch event {
        case .loadList(let limit):
            getPokemonList(limit: limit)
            
        case .showPokemonDetail(let pokemonId, let viewModel):
            mutableState.accept(.navigateToPokemonDetailScreen(pokemonId: pokemonId, with: viewModel))
        }
    }
}

