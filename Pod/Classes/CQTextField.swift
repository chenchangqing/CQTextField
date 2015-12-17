//
//  CQTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

@IBDesignable public class CQTextField: UIView {
    
    @IBInspectable dynamic public var iconLength: CGFloat = 16 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable dynamic public var placeholder: String = "请输入注册/登录手机号" {
        didSet {
            textField.placeholder = placeholder
        }
    }
    @IBInspectable dynamic public var iconImage: UIImage? = UIImage(named: "Frameworks/CQTextField.framework/CQTextField.bundle/mobile_32px.png") {
        didSet {
            iconLayer.contents = iconImage
        }
    }
    
    private var iconLayer = CALayer()
    private var textField = UITextField()

    override public func drawRect(rect: CGRect) {

        // 边界
        self.layer.borderColor  = UIColor.grayColor().CGColor
        self.layer.borderWidth  = 1
        self.layer.cornerRadius = 5
        
        // 图片
        let minLength   = min(self.bounds.width, self.bounds.height)
        let iconMargin  = (minLength - iconLength)/2
        
        iconLayer.frame     = CGRect(origin: CGPoint(x: iconMargin, y: iconMargin), size: CGSize(width: iconLength, height: iconLength))
        iconLayer.contents  = iconImage?.CGImage
        //iconLayer.backgroundColor = UIColor.grayColor().CGColor
        
        self.layer.addSublayer(iconLayer)
        
        // 文本框
        let marginBetweenIconAndText: CGFloat = 4
        textField.frame = CGRectInset(rect, iconLength + iconMargin + marginBetweenIconAndText, marginBetweenIconAndText)
        textField.frame = CGRect(origin: textField.frame.origin, size: CGSize(width: textField.bounds.width + iconLength + marginBetweenIconAndText, height: textField.bounds.height))
        //textField.backgroundColor = UIColor.magentaColor()
        textField.placeholder = placeholder
        
        self.addSubview(textField)
    }

}
