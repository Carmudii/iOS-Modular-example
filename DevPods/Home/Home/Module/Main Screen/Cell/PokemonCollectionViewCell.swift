//
//  PokemonCollectionViewCell.swift
//  Home
//
//  Created by Car mudi on 07/02/23.
//

import Common
import UIKit
import RxSwift
import WebKit

final class PokemonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public properties
    
    static let size = CGSize(width: Int(ScreenUtils.width / 3), height: 150)
    
    // MARK: - Private @IBOutlet properties
    
    // @IBOutlet private weak var contentView: UIView!
    @IBOutlet private var shimmerView: [ShimmerView]!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var title: UILabel!
    
    // MARK: - Private properties
    
    private var viewModel: PokemonCollectionViewModel?

    private var disposeBag = DisposeBag()
    
    // MARK: - Override methods

    override func awakeFromNib() {
        super.awakeFromNib()
        configureContentView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    // MARK: - Public methods
    
    func bind(viewModel: PokemonCollectionViewModel) {
        self.viewModel = viewModel
        
        configureView()
    }
    
    // MARK: - Private methods
    
    private func configureContentView() {
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func configureShimmer(_ enable: Bool) {
        shimmerView.forEach { shimmer in
            enable ? shimmer.startShimmering() : shimmer.stopShimmering()
        }
    }
    
    private func configureView() {
        
        viewModel?.isLoadingObservable
            .withUnretainedObject(self)
            .subscribe(onNext: { (viewModel, enable) in
                viewModel.configureShimmer(enable)
            })
            .disposed(by: disposeBag)
        
        viewModel?.imageObservable
            .withUnretainedObject(self)
            .subscribe(onNext: { (cell, image) in
                cell.imageView.image = image
            })
            .disposed(by: disposeBag)
        
        viewModel?.pokemonNameObservable
            .bind(to: title.rx.text)
            .disposed(by: disposeBag)
    }
}
