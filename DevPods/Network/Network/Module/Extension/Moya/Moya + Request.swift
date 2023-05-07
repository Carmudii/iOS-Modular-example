//
//  Moya + Request.swift
//  Network
//
//  Created by Car mudi on 06/02/23.
//

import Alamofire
import Foundation
import Moya
import RxSwift

extension MoyaProvider {
    
    public func requestWithValidation(
        _ target: Target,
        maxRetryAttempt: Int = 1,
        retryInterval: RxTimeInterval = .seconds(1),
        errorDecoder: JSONDecoder = .default
    ) -> Single<Response> {
        
        let requestSingle = self.rx.request(target)
            .do(onError: { (error: Error) in
                print("DEBUG -> target \(target.path), error: \(error.localizedDescription)")
            })
                .catch { error -> Single<Response> in
                    if
                        case let MoyaError.underlying(underlying, _) = error,
                        case let AFError.sessionTaskFailed(afError) = underlying,
                        (afError as NSError).code == URLError.timedOut.rawValue
                    {
                        return Single<Response>.error(ApiError.timedOut)
                    }
                    return Single<Response>.error(ApiError.unknown)
                }
                .flatMap { (response: Response) -> Single<Response> in
                    
                    let responseSuccess: CountableRange<Int> = (200..<300)
                    
                    switch response.statusCode {
                    case responseSuccess:
                        return .just(response)
                        
                    default:
                        return .error(ApiError.unknown)
                    }
                }
        
        return requestSingle
    }
    
}
