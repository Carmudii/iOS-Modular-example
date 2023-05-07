//
//  UIKit + UIColor.swift
//  
//
//  Created by Car mudi on 01/02/23.
//

import UIKit

fileprivate let bundle = Bundle(for: Common.self).resource

extension UIColor {
    
    public static var navigationBarBackground: UIColor {
        UIColor(named: "navigationBarBackground", in: bundle, compatibleWith: nil) ?? UIColor.white
    }

    public static var background: UIColor {
        UIColor(named: "background", in: bundle, compatibleWith: nil) ?? UIColor.white
    }
    
    public static var shimmerContent: UIColor {
        UIColor(named: "shimmerContent", in: bundle, compatibleWith: nil) ?? UIColor.white
    }
}
