//
//  ApiError.swift
//  Alamofire
//
//  Created by Car mudi on 06/02/23.
//

public enum ApiError: Error {
    case timedOut
    case systemError(code: String?, message: String?)
    case unknown
    case notFound
}
