//
//  UIKit + UIFont.swift
//  
//
//  Created by Car mudi on 01/02/23.
//

import UIKit

extension UIFont {

    public static func myriadProBold(size: CGFloat) -> UIFont {
        return UIFont(name: "MYRIADPRO-BOLD", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }

    public static func myriadProSemibold(size: CGFloat) -> UIFont {
        return UIFont(name: "MYRIADPRO-SEMIBOLD", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }

    public static func myriadProRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "MYRIADPRO-REGULAR", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
