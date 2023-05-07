//
//  PokemonDetailEndPoint.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

import Common
import Network
import Moya

enum PokemonDetailEndPoint {
    case getDetail(pokemonId: Int)
}

extension PokemonDetailEndPoint: BaseEndPoint {
    
    var parameters: [String : Any] {
        switch self {
        case .getDetail:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getDetail(let pokemonId):
            return "/pokemon-species/\(pokemonId)/"
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        URLEncoding.default
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var authorizationType: Moya.AuthorizationType? {
        .none
    }
}

