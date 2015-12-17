//
//  CQTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

func scaleImage(image: UIImage, toScale scaleSize: CGFloat) -> UIImage {
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize))
    image.drawInRect(CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return scaledImage
}

let CQTextFieldFrameworkSrcName = "Frameworks/CQTextField.framework/CQTextField.bundle/"

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
    @IBInspectable dynamic public var iconImage: UIImage? = UIImage(named: "\(CQTextFieldFrameworkSrcName)mobile_32px.png") {
        didSet {
            iconLayer.contents = iconImage?.CGImage
        }
    }
    
    internal let iconLayer = CALayer()
    internal let textField = UITextField()
    
    // 边界
    @IBInspectable dynamic public var borderColor: UIColor = UIColor.grayColor() {
        didSet {
            self.layer.borderColor = borderColor.CGColor
        }
    }
    internal let borderWidth: CGFloat = 1
    internal let cornerRadius : CGFloat = 4
    
    // 文本框
    internal let paddingIconAndText: CGFloat = 8
    internal let textFieldHeight: CGFloat = 21
    internal let textFieldMargin: CGFloat = 4
    internal let textFieldFont: CGFloat = 14

    override public func drawRect(rect: CGRect) {

        // 边界
        self.layer.borderColor  = borderColor.CGColor
        self.layer.borderWidth  = borderWidth
        self.layer.cornerRadius = cornerRadius
        
        // 图片
        let minLength       = min(self.bounds.width, self.bounds.height)
        let iconMargin      = (minLength - iconLength)/2
        let iconLayerOrigin = CGPoint(x: iconMargin, y: iconMargin)
        let iconLayerSize   = CGSize(width: iconLength, height: iconLength)
        
        iconLayer.frame             = CGRect(origin: iconLayerOrigin, size: iconLayerSize)
        iconLayer.contents          = iconImage?.CGImage
        //iconLayer.backgroundColor   = UIColor.grayColor().CGColor
        
        self.layer.addSublayer(iconLayer)
        
        // 文本框
        let textFieldOriginX    = CGRectGetMaxX(iconLayer.frame) + paddingIconAndText
        let textFieldOrigin     = CGPoint(x:  textFieldOriginX, y: textFieldMargin)
        let textFieldSizeWidth  = rect.width - textFieldOrigin.x - iconMargin
        let textFieldSize       = CGSize(width: textFieldSizeWidth, height: textFieldHeight)
        
        textField.frame             = CGRect(origin: textFieldOrigin, size: textFieldSize)
        textField.center.y          = rect.height/2
        textField.placeholder       = placeholder
        textField.font = UIFont.systemFontOfSize(textFieldFont)
        //textField.backgroundColor   = UIColor.magentaColor()
        
        self.addSubview(textField)
    }

}
