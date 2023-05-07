//
//  Moya + Protocol.swift
//  Alamofire
//
//  Created by Car mudi on 07/02/23.
//

import Foundation
import Moya

public protocol BaseEndPoint: TargetType, AccessTokenAuthorizable {
    
    var parameters: [String: Any] { get }
    
    var parameterEncoding: Moya.ParameterEncoding { get }
}

public extension BaseEndPoint {
    
    var baseURL: URL {
        URL(string: "https://pokeapi.co/api/v2")!
    }
    
    var sampleData: Data {
        Data()
    }
    
    var parameters: [String: Any] {
        [:]
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        JSONEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    // TODO: Implement default HTTP header for all enpoints here
    var headers: [String: String]? {
        return nil
    }
}
