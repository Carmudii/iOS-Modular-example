//
//  Module.swift
//  Home
//
//  Created by Car mudi on 03/02/23.
//

import UIKit
import Common

public final class Home {
    
    public init() {
        
    }

    public func makeViewController() -> UIViewController {
        let viewModel = MainViewModel()
        return MainViewController(viewModel: AnyViewModel(viewModel))
    }
}
