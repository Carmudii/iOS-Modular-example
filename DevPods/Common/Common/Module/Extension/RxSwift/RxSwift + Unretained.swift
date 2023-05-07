//
//  RxSwift + Unretained.swift
//  Common
//
//  Created by Car mudi on 07/02/23.
//

import Foundation
import RxSwift

extension ObservableType {
    
    public func withUnretainedObject<T: AnyObject>(_ owner: T) -> Observable<(T, Element)> {
        
        flatMap { [weak owner] (element) -> Observable<(T, Element)> in
            
            guard let owner = owner else {
                return .empty()
            }
            return .just((owner, element))
        }
    }
}

extension PrimitiveSequenceType where Trait == SingleTrait {
    
    public func withUnretainedObject<T: AnyObject>(_ owner: T) -> Single<(T, Element)> {
        
        flatMap { [weak owner] (element) in
            
            guard let owner = owner else {
                return .never()
            }
            return .just((owner, element))
        }
    }
}
