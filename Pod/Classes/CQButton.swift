//
//  CQButton.swift
//  Pods
//
//  Created by green on 15/12/18.
//
//

import UIKit

@IBDesignable public class CQButton: UIButton {
    
    @IBInspectable dynamic public var borderWidth: CGFloat = 1 {
        
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable dynamic public var cornerRadius : CGFloat = 4 {
        
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable dynamic public var borderColor: UIColor = UIColor.lightGray {
        
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable dynamic public var bgColor: UIColor = UIColor.lightGray {
        
        didSet {
            self.layer.backgroundColor = bgColor.cgColor
        }
    }
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.backgroundColor = bgColor.cgColor
        self.setTitleColor(UIColor.white, for: UIControlState())
        self.setTitleColor(UIColor.white, for: .highlighted)
    }

}
