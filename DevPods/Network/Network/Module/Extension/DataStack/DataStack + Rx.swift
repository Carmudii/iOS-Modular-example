//
//  DataStack + Rx.swift
//  Network
//
//  Created by Car mudi on 09/02/23.
//

import Foundation
import CoreStore
import RxSwift

extension DataStack {
    
    func performAsCompletable(_ execution: @escaping (AsynchronousDataTransaction) throws -> Void) -> Completable {
        
        Completable.create { [weak self] completable in
            
            self?.perform(
                asynchronous: { transaction in
                    try execution(transaction)
                },
                success: { _ in
                    completable(.completed)
                },
                failure: { error in
                    completable(.error(error))
                }
            )
            
            return Disposables.create {}
        }
    }
    
    func performAsSingle<T>(_ transaction: @escaping () throws -> T) -> Single<T> {
        
        Single.create { single in
            
            do {
                single(.success(try transaction()))
            } catch {
                single(.failure(error))
            }
            
            return Disposables.create {}
        }
    }
}
