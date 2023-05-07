//
//  UICollectionView + Dequeue

//  Common
//
//  Created by Car mudi on 07/02/23.
//

import UIKit

extension UICollectionView {
    
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    
    public func register<T: UICollectionViewCell>(_ collectionViewCell: T.Type, with bundle: Bundle = .main) {
        register(T.nib(with: bundle), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}

protocol ReusableView: AnyObject {}

extension ReusableView {
    
    static func nib(with bundle: Bundle) -> UINib {
        return UINib(nibName: reuseIdentifier, bundle: bundle)
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView {}
