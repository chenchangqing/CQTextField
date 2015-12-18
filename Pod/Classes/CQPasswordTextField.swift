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
            updateEyeBtnSelectedImageColor()
        }
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // 修改默认图标 文字
        iconImage = UIImage(named: "\(CQTextFieldFrameworkSrcName)Password_64px.png")
        placeholder = "请设置登录密码"
        
        // 密码可见按钮
        if let closeEyeImage=UIImage(named: "\(CQTextFieldFrameworkSrcName)close_eye_50px.png") {
            
            let tempImage       = scaleImage(closeEyeImage, toScale: 0.5)
            eyeButton.frame     = rightView.bounds
            eyeButton.setImage(tempImage, forState: .Normal)
            updateEyeBtnSelectedImageColor()
            rightView.addSubview(eyeButton)
        }
        
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
    
    func updateEyeBtnSelectedImageColor() {
        
        if let openEyeImage = UIImage(named: "\(CQTextFieldFrameworkSrcName)open_eye_50px.png") {
            
            eyeButton.tintColor = openEyeImageColor
            let tempImage       = scaleImage(openEyeImage, toScale: 0.5).imageWithRenderingMode(.AlwaysTemplate)
            eyeButton.setImage(tempImage, forState: .Selected)
        }
        
    }

}
