//
//  TabBarViewModel.swift
//  Base Code
//
//  Created by Car mudi on 01/02/23.
//

import Common
import RxSwift
import RxCocoa

final class TabBarViewModel {

    // MARK: - Private Properties

    private let mutableState = BehaviorRelay<State?>(value: nil)
    private let disposeBag = DisposeBag()
}

extension TabBarViewModel: ViewModel {

    var state: Observable<State> {
        mutableState.asObservable().filterNil()
    }

    func onReceiveEvent(_ event: Event) {

        switch event {
        case .tabA:
            mutableState.accept(.tabA)
        case .tabB:
            mutableState.accept(.tabB)
        }
    }
}

extension TabBarViewModel {

    enum Tab: Int, CaseIterable {
        case tabA
        case tabB
    }
}
