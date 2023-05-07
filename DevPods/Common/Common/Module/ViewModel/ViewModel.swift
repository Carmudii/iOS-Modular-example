//
//  ViewModel.swift
//  
//
//  Created by Car mudi on 01/02/23.
//

import RxSwift

public protocol ViewModel: AnyObject {

    associatedtype State: ViewModelState
    associatedtype Event: ViewModelEvent

    var state: Observable<State> { get }

    func onReceiveEvent(_ event: Event)
}

public protocol ViewModelState {
}

public protocol ViewModelEvent {
}

public final class AnyViewModel<State: ViewModelState, Event: ViewModelEvent>: ViewModel {

    // MARK: - Public Properties

    public let state: Observable<State>

    // MARK: - Private Properties

    private let eventHandler: (Event) -> Void

    // MARK: - Initialization

    public init<WrappedViewModel: ViewModel>(
        _ wrappedViewModel: WrappedViewModel
    ) where WrappedViewModel.State == State, WrappedViewModel.Event == Event {

        self.state = wrappedViewModel.state
        self.eventHandler = wrappedViewModel.onReceiveEvent
    }

    // MARK: - Public Methods

    public func onReceiveEvent(_ event: Event) {
        eventHandler(event)
    }
}
