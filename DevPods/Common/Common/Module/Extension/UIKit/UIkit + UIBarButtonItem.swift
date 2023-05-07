//
//  UIkit + UIBarButtonItem.swift
//  
//
//  Created by Car mudi on 01/02/23.
//

import UIKit
import RxCocoa

fileprivate let bundle = Bundle(for: Common.self).resource

extension UIBarButtonItem {

    public static func back(onTapped: @escaping () -> Void) -> UIBarButtonItem {

        let button = UIButton.init(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.setImage(UIImage(named: "iconBack", in: bundle, compatibleWith: nil), for: .normal)
        button.contentHorizontalAlignment = .left
        _ = button.rx.controlEvent(.touchUpInside)
            .take(until: button.rx.deallocating)
            .subscribe(onNext: { _ in
                onTapped()
            })
        return UIBarButtonItem(customView: button)
    }

    public static func title(
        _ title: String?,
        isEnable: Bool = true,
        titleColor: UIColor = UIColor.white,
        titleFont: UIFont = .myriadProRegular(size: 16.0),
        onTapped: @escaping () -> Void
    ) -> UIBarButtonItem {

        let button = UIButton.init(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.setTitle(title, for: .init())
        button.isEnabled = isEnable
        button.titleLabel?.font = titleFont
        button.setTitleColor(isEnable ? titleColor : titleColor.withAlphaComponent(0.40), for: .init())
        button.contentHorizontalAlignment = .left
        _ = button.rx.controlEvent(.touchUpInside)
            .take(until: button.rx.deallocating)
            .subscribe(onNext: { _ in
                onTapped()
            })
        return UIBarButtonItem(customView: button)
    }

    public static func image(
        _ image: UIImage?,
        width: CGFloat = 44,
        isEnable: Bool = true,
        onTapped: @escaping () -> Void
    ) -> UIBarButtonItem {

        let button = UIButton.init(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .right
        _ = button.rx.controlEvent(.touchUpInside)
            .take(until: button.rx.deallocating)
            .subscribe(onNext: { _ in
                onTapped()
            })

        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.isEnabled = isEnable
        return barButtonItem
    }
}
