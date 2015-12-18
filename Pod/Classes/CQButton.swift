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
    @IBInspectable dynamic public var borderColor: UIColor = UIColor.lightGrayColor() {
        
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable dynamic public var bgColor: UIColor = UIColor.lightGrayColor() {
        
        didSet {
            self.layer.backgroundColor = bgColor.CGColor
        }
    }

    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.CGColor
        self.layer.borderWidth = borderWidth
        self.layer.backgroundColor = bgColor.CGColor
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
    }

}
