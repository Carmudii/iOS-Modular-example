//
//  UITableView + Dequeue.swift
//  Common
//
//  Created by Car mudi on 07/02/23.
//

import UIKit

extension UITableView {
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    
    public func register<T: UITableViewCell>(_ tableViewCell: T.Type, with bundle: Bundle = .main) {
        register(T.nib(with: bundle), forCellReuseIdentifier: T.reuseIdentifier)
    }
}

extension UITableViewCell: ReusableView {}

extension UITableViewHeaderFooterView: ReusableView {}
