//
//  Designable.swift
//  NYTimeDemo
//
//  Created by Prashant on 25/12/20.
//

import Foundation
import UIKit


@IBDesignable
extension UIView{
    
    @IBInspectable
   var cornerRadius:CGFloat{
        
        get{
            
            return layer.cornerRadius
            
        }
        set{
            
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
}
