//
//  Moya + Default.swift
//  Network
//
//  Created by Car mudi on 06/02/23.
//

import Foundation
import Alamofire
import Moya
import RxSwift

extension MoyaProvider {
    
    // MARK: - Public Properties
    
    public static func defaultProvider(
        with configuration: URLSessionConfiguration? = nil
    ) -> MoyaProvider {
        
        MoyaProvider(
            session: defaultSession(with: configuration ?? makeURLSessionConfiguration()),
            plugins: defaultPlugins()
        )
    }
    
    // MARK: - Private Properties
    
    private static func defaultSession(
        with configuration: URLSessionConfiguration
    ) -> Alamofire.Session {
        
        let session = Alamofire.Session(
            configuration: configuration,
            serverTrustManager: ServerTrustManager(evaluators: makeHostEvaluators())
        )
        
        return session
    }
    
    private static func defaultPlugins() -> [PluginType] {
        return [
            NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        ]
    }
}

// Make instance of `URLSessionConfiguration` that completely disable system level caching for HTTP traffic.
private func makeURLSessionConfiguration() -> URLSessionConfiguration {
    
    let configuration = URLSessionConfiguration.af.default
    configuration.urlCache = nil
    
    return configuration
    
}

public func makeHostEvaluators() -> [String: ServerTrustEvaluating] {
    // TODO: - Handle ssl-pining environment
    return [
        "pokeapi.co": DisabledTrustEvaluator(),
        "raw.githubusercontent.com": DisabledTrustEvaluator()
    ]
}
