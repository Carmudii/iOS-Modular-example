//
//  PokemonListEndPoint.swift
//  Pods
//
//  Created by Car mudi on 06/02/23.
//

import Network
import Moya

enum PokemonListEndPoint {
    case getPokemonList(offset: Int, limit: Int)
    case getPokemonImage(id: Int)
}

extension PokemonListEndPoint: BaseEndPoint {
    
    var baseURL: URL {
        switch self {
        case .getPokemonList:
            return URL(string: "https://pokeapi.co/api/v2")!

        case .getPokemonImage:
            return URL(string: "https://raw.githubusercontent.com")!
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .getPokemonList(let offset, let limit):
            return ["offset": offset, "limit": limit]
            
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getPokemonList:
            return "/pokemon-species"
        case .getPokemonImage(let id):
            return "/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/\(id).png"
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        URLEncoding.default
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var authorizationType: Moya.AuthorizationType? {
        return .none
    }
    
}
