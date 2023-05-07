//
//  PokemonListResponseModel.swift
//  Pods
//
//  Created by Car mudi on 06/02/23.
//

import Foundation

public struct PokemonListResponseModel: Codable{
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonResult]

    enum StringKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}

// MARK: - Result
struct PokemonResult: Codable {
    let name: String
    let url: String
    
    enum StirngKeys: String, CodingKey {
        case name
        case url
    }
}
