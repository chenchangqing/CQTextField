//
//  CQPasswordTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

@IBDesignable public class CQPasswordTextField: CQCutLineTextField {
    
    // 密码可见按钮
    private let eyeButton = UIButton()
    
    // 密码可见按钮选中颜色
    @IBInspectable dynamic public var openEyeImageColor:UIColor = UIColor.magentaColor() {
        didSet {
            updateOpenEyeImage()
        }
    }
    // 闭眼图片
    @IBInspectable dynamic public var closeEyeImage:UIImage? {
        didSet {
            updateCloseEyeImage()
        }
    }
    // 睁眼图片
    @IBInspectable dynamic public var openEyeImage:UIImage? {
        didSet {
            updateOpenEyeImage()
        }
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        eyeButton.frame     = rightView.bounds
        rightView.addSubview(eyeButton)
        
        eyeButton.addTarget(self, action: Selector("eyeButtonClicked:"), forControlEvents: .TouchUpInside)
        
        // 文本框
        textField.secureTextEntry = true
    }
    
    func eyeButtonClicked(sender: UIButton) {
        
        sender.selected = !sender.selected
        
        if sender.selected {
            
            textField.secureTextEntry = false
        } else {
            
            textField.secureTextEntry = true
        }
    }
    
    func updateOpenEyeImage() {
        
        if let openEyeImage = openEyeImage {
            
            eyeButton.tintColor = openEyeImageColor
            let tempImage       = scaleImage(openEyeImage, toScale: 0.5).imageWithRenderingMode(.AlwaysTemplate)
            eyeButton.setImage(tempImage, forState: .Selected)
        }
    }
    
    func updateCloseEyeImage() {
        
        if let closeEyeImage = closeEyeImage {
            
            let tempImage       = scaleImage(closeEyeImage, toScale: 0.5)
            eyeButton.setImage(tempImage, forState: .Normal)
        }
    }

}
