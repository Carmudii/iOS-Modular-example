//
//  JSONDecoder + default.swift
//  Alamofire
//
//  Created by Car mudi on 06/02/23.
//

extension JSONDecoder {
    
    public static var `default`: JSONDecoder {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
