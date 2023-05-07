//
//  PokemonDetailViewController.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

import Common
import UIKit
import RxSwift

final class PokemonDetailViewController: BaseViewController {
    
    typealias ViewModel = AnyViewModel<PokemonDetailViewModel.State, PokemonDetailViewModel.Event>
    
    // MARK: - Private @IBOutlet properties
    
    @IBOutlet private weak var baseHappiness: UILabel!
    @IBOutlet private weak var captureRate: UILabel!
    @IBOutlet private weak var color: UILabel!
    @IBOutlet private weak var eggGroup: UILabel!
    @IBOutlet private weak var evolves: UILabel!
    @IBOutlet private weak var informationLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Private properties
    
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
        configureNavigationBar(with: "Pokemon Detail")
        
        bindViewModel()
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
                case .goBack:
                    viewController.navigationController?.popToRootViewController(animated: true)
                    
                case .initial(let pokemonDetail):
                    viewController.configureDisplayItem(with: pokemonDetail)
                    viewController.configureDisplayInformationLabel(with: pokemonDetail)
                    
                case .configureNavigationBar(let title, let image):
                    viewController.configureNavigationBar(with: title, image: image)
                    
                case .setPokemonImage(let image):
                    viewController.imageView.image = image
                    
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.onReceiveEvent(.viewDidLoad)
    }
    
    private func configureNavigationBar(with title: String, image: UIImage? = nil) {
        configureNavigationBar(
            title: title,
            leftNavigationItems: [
                .back { [weak self] in
                    self?.viewModel.onReceiveEvent(.goBack)
                }
            ],
            rightNavigationItems: [
                .image(
                    image,
                    width: 44,
                    isEnable: true,
                    onTapped: {
                        print("DEBUG -> CALLED!")
                    }
                )
            ]
        )
    }
    
    private func configureDisplayItem(with detail: PokemonDetailResponseModel) {
        baseHappiness.text = String(detail.baseHappiness)
        captureRate.text = String(detail.captureRate)
        color.text = detail.color.name
        eggGroup.text = detail.eggGroups.first?.name ?? "-"
        evolves.text = detail.evolvesFromSpecies?.name ?? "-"
    }
    
    private func configureDisplayInformationLabel(with detail: PokemonDetailResponseModel) {
        guard let pokemon = detail.flavorTextEntries.first, pokemon.language.name == "en" else {
            informationLabel.text = "- no information -"
            return
        }
        
        informationLabel.text = pokemon.flavorText.replacingOccurrences(of: "\n", with: " ")
    }
}
