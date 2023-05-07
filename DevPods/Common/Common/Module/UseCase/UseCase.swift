//
//  UseCase.swift
//  Alamofire
//
//  Created by Car mudi on 07/02/23.
//

import Foundation
import RxSwift

public protocol UseCase {
    
    associatedtype Result
    associatedtype Parameters
    
    static func make() -> Self
    
    func execute(with parameters: Parameters) -> Single<Result>
}

public struct AnyUseCase<Result, Parameters>: UseCase {
    
    private let execution: (Parameters) -> Single<Result>
    
    public init<WrappedUseCase: UseCase>(
        _ wrappedUseCase: WrappedUseCase
    ) where WrappedUseCase.Result == Result, WrappedUseCase.Parameters == Parameters {
        self.execution = wrappedUseCase.execute(with:)
    }
    
    public static func make() -> AnyUseCase {
        fatalError("calling make() on AnyUseCase is not supported")
    }
    
    public func execute(with parameters: Parameters) -> Single<Result> {
        execution(parameters)
    }
}
