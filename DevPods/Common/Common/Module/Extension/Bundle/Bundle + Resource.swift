//
//  Bundle + Resource.swift
//  Feature_A
//
//  Created by Car mudi on 02/02/23.
//

import Foundation

extension Bundle {
    
    public var resource: Bundle {
        // static framework
        if let resourceURL = resourceURL,
           let resourceBundle = Bundle(url: resourceURL.appendingPathComponent(ModuleName.name + ".bundle")) {
            return resourceBundle
        } else {
            // dynamic framework
            return self
        }
    }
}

private struct ModuleName {
    static var name: String = {
        String(reflecting: ModuleName.self).components(separatedBy: ".").first ?? ""
    }()
}
