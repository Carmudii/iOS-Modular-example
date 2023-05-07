//
//  MainViewController.swift
//  Feature A
//
//  Created by Car mudi on 01/02/23.
//

import Common
import UIKit
import RxSwift

final class MainViewController: BaseViewController {

    typealias ViewModel = AnyViewModel<MainViewModel.State, MainViewModel.Event>

    // MARK: - Private properties
    
    @IBOutlet private weak var collectionView: UICollectionView!

    private var pokemonList: [PokemonCollectionViewModel] = [PokemonCollectionViewModel]()
    private let viewModel: ViewModel

    // MARK: - Initialized

    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(title: "Pokemon list")
        bindViewModel()
        configureCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Private methods

    private func bindViewModel() {

        viewModel.state.observe(on: MainScheduler.instance)
            .withUnretained(self)
            .subscribe(onNext: { (viewController, state) in

                switch state {
                case .initial(let data):
                    viewController.pokemonList = data
                    viewController.collectionView.reloadData()
                    
                case .navigateToPokemonDetailScreen(let pokemonId, let viewModel):
                    viewController.navigateToDetailScreen(pokemonId: pokemonId, with: viewModel)
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.onReceiveEvent(.loadList(limit: 20))
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PokemonCollectionViewCell.self, with: Bundle(for: Self.self).resource)
    }
    
    private func onHandlePagination(_ isLoadMore: Bool) {
        if !isLoadMore { return }
        
        viewModel.onReceiveEvent(.loadList(limit: 20))

    }
    
    // MARK: - Navigate methods
    
    private func navigateToDetailScreen(pokemonId: Int, with itemData: PokemonCollectionViewModel) {
        let viewModel = PokemonDetailViewModel(pokemonId: pokemonId, with: itemData)
        let viewController = PokemonDetailViewController(viewModel: AnyViewModel(viewModel))
        viewController.hidesBottomBarWhenPushed = true

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Create cell
    
    private func createPokemonCell(viewModel: PokemonCollectionViewModel, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as PokemonCollectionViewCell
        cell.bind(viewModel: viewModel)
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        PokemonCollectionViewCell.size
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        let sideMargin: CGFloat = 20
        let totalCellWidth = PokemonCollectionViewCell.size.width * 2
        let totalMiddleSpacing: CGFloat = collectionView.width - totalCellWidth - sideMargin
        let menuSpacing: CGFloat = totalMiddleSpacing / 4
        return menuSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        let reachLastItem = indexPath.item == pokemonList.count - 1
        onHandlePagination(reachLastItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemData = pokemonList[indexPath.item]
        
        if !itemData.isLoading.value {
            viewModel.onReceiveEvent(.showPokemonDetail(pokemonId: indexPath.item + 1, with: itemData))
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        createPokemonCell(viewModel: pokemonList[indexPath.row], indexPath: indexPath)
    }
}
