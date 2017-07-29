//
//  Additions to simplify constraints adding
//

import Foundation
import UIKit

extension UIView {
    
    func leading(to anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0.0) {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func trailing(to anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0.0) {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func top(to anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0.0) {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func bottom(to anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0.0) {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func centerY(to anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0.0) {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func height(to constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func width(to constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
}
