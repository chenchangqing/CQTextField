//
//  CQTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

func scaleImage(_ image: UIImage, toScale scaleSize: CGFloat) -> UIImage {
    
    UIGraphicsBeginImageContext(CGSize(width: image.size.width * scaleSize, height: image.size.height * scaleSize))
    image.draw(in: CGRect(x: 0, y: 0, width: image.size.width * scaleSize, height: image.size.height * scaleSize))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return scaledImage!
}

let CQTextFieldFrameworkSrcName = "Frameworks/CQTextField.framework/CQTextField.bundle/"

@IBDesignable public class CQTextField: UIView {
    
    @IBInspectable dynamic var iconWidth: CGFloat = 16 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable dynamic var iconImage: UIImage? {
        didSet {
            iconLayer.contents = iconImage?.cgImage
        }
    }
    @IBInspectable dynamic var placeholder: String = "" {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    internal let iconLayer = CALayer()
    public let textField = UITextField()
    
    // 边界
    @IBInspectable dynamic var borderColor: UIColor = UIColor.gray {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable dynamic var focusBorderColor: UIColor = UIColor.magenta
    
    internal let borderWidth: CGFloat = 1
    internal let cornerRadius : CGFloat = 4
    
    // 文本框
    internal let paddingIconAndText: CGFloat = 8
    internal let textFieldHeight: CGFloat = 21
    internal let textFieldMargin: CGFloat = 4
    internal let textFieldFont: CGFloat = 14
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        // 边界
        self.layer.borderColor  = borderColor.cgColor
        self.layer.borderWidth  = borderWidth
        self.layer.cornerRadius = cornerRadius
        
        // 图片
        let minLength       = min(self.bounds.width, self.bounds.height)
        let iconMargin      = (minLength - iconWidth)/2
        let iconLayerOrigin = CGPoint(x: iconMargin, y: iconMargin)
        let iconLayerSize   = CGSize(width: iconWidth, height: iconWidth)
        
        iconLayer.frame             = CGRect(origin: iconLayerOrigin, size: iconLayerSize)
        iconLayer.contents          = iconImage?.cgImage
        //iconLayer.backgroundColor   = UIColor.grayColor().CGColor
        
        self.layer.addSublayer(iconLayer)
        
        // 文本框
        let textFieldOriginX    = iconLayer.frame.maxX + paddingIconAndText
        let textFieldOrigin     = CGPoint(x:  textFieldOriginX, y: textFieldMargin)
        let textFieldSizeWidth  = rect.width - textFieldOrigin.x - iconMargin
        let textFieldSize       = CGSize(width: textFieldSizeWidth, height: textFieldHeight)
        
        textField.frame             = CGRect(origin: textFieldOrigin, size: textFieldSize)
        textField.center.y          = rect.height/2
        textField.placeholder       = placeholder
        textField.font = UIFont.systemFont(ofSize: textFieldFont)
        textField.clearButtonMode   = .whileEditing
        //textField.backgroundColor   = UIColor.magentaColor()
        
        self.addSubview(textField)
    }
    
    // MARK: - UITextField Observing
    
    override public func willMove(toSuperview newSuperview: UIView?) {
        
        if newSuperview != nil {
            
            NotificationCenter.default.addObserver(self, selector: #selector(CQTextField.textFieldDidEndEditing), name:NSNotification.Name.UITextFieldTextDidEndEditing, object: self.textField)
            
            NotificationCenter.default.addObserver(self, selector: #selector(CQTextField.textFieldDidBeginEditing), name:NSNotification.Name.UITextFieldTextDidBeginEditing, object: self.textField)
        } else {

            NotificationCenter.default.removeObserver(self)
        }
    }
    
    /**
     The textfield has started an editing session.
     */
    func textFieldDidBeginEditing() {
        animateViewsForTextEntry()
    }
    
    /**
     The textfield has ended an editing session.
     */
    func textFieldDidEndEditing() {
        animateViewsForTextDisplay()
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "entering text" state.
     */
    func animateViewsForTextEntry() {
        
        self.layer.borderColor  = focusBorderColor.cgColor
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "display input text" state.
     */
    func animateViewsForTextDisplay() {
        
        self.layer.borderColor  = borderColor.cgColor
    }

}
