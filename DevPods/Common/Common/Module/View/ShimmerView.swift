//
//  ShimmerView.swift
//  Common
//
//  Created by Car mudi on 08/02/23.
//

import UIKit
import Shimmer
import RxSwift
import RxCocoa

public final class ShimmerView: UIView {
    
    // MARK: - Public Properties
    
    @IBInspectable
    var contentColor: UIColor = .shimmerContent {
        didSet { contentView.backgroundColor = contentColor }
    }
    
    // MARK: - Private Properties
    
    private let shimmerView = FBShimmeringView()
    private let contentView = UIView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContentView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureContentView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        configureFrames()
    }
    
    // MARK: - Public Methods
    
    public func startShimmering() {
        
        isHidden = false
        shimmerView.isShimmering = true
    }
    
    public func stopShimmering() {
        
        isHidden = true
        shimmerView.isShimmering = false
    }
    
    // MARK: - Private Methods
    
    private func configureContentView() {
        
        shimmerView.contentView = contentView
        shimmerView.shimmeringHighlightLength = 0.8
        addSubview(shimmerView)
        
        layer.cornerRadius = 3
        layer.masksToBounds = true
        
        configureFrames()
    }
    
    private func configureFrames() {
        
        let contentFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        shimmerView.frame = contentFrame
        contentView.frame = contentFrame
    }
}

public extension Reactive where Base == ShimmerView {
    
    var animating: Binder<Bool> {
        Binder(base) { (shimmerView, animating) in
            
            if animating {
                shimmerView.startShimmering()
            } else {
                shimmerView.stopShimmering()
            }
        }
    }
}

public extension Array where Element == ShimmerView {
    
    func startShimmering() {
        
        forEach { view in
            view.startShimmering()
        }
    }
    
    func stopShimmering() {
        
        forEach { view in
            view.stopShimmering()
        }
    }
}
