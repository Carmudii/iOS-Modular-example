//
//  Predicate.swift
//  Network
//
//  Created by Car mudi on 09/02/23.
//

enum Predicate {
    case stringBeginningWith
    case custom(value: String)
    case contains
    
    var value: String {
        switch self {
        case .stringBeginningWith:
            return "%K BEGINSWITH[c] %@"
            
        case .contains:
            return "%K CONTAINS[c] %@"
            
        case .custom(let val):
            return val
        }
    }
}
