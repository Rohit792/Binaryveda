//
//  constants.swift
//  Binaryveda
//
//  Created by Rohit Sonawane on 13/06/21.
//

import Foundation
import UIKit

@IBDesignable
class DesignableView: UIView {
}

extension UIView {

 @IBInspectable
 var cornerRadius: CGFloat {
     get {
         return layer.cornerRadius
     }
     set {
         layer.cornerRadius = newValue
     }
 }
}
