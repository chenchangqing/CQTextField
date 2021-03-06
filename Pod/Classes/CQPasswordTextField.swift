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
    @IBInspectable dynamic var eyeImageColor:UIColor = UIColor.magenta {
        didSet {
            updateOpenEyeImage()
        }
    }
    // 闭眼图片
    @IBInspectable dynamic var closeEyeImage:UIImage? {
        didSet {
            updateCloseEyeImage()
        }
    }
    // 睁眼图片
    @IBInspectable dynamic var eyeImage:UIImage? {
        didSet {
            updateOpenEyeImage()
        }
    }
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        eyeButton.frame     = rightView.bounds
        rightView.addSubview(eyeButton)
        
        eyeButton.addTarget(self, action: #selector(CQPasswordTextField.eyeButtonClicked(_:)), for: .touchUpInside)
        
        // 文本框
        textField.isSecureTextEntry = true
    }
    
    func eyeButtonClicked(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            
            textField.isSecureTextEntry = false
        } else {
            
            textField.isSecureTextEntry = true
        }
    }
    
    func updateOpenEyeImage() {
        
        if let eyeImage = eyeImage {
            
            eyeButton.tintColor = eyeImageColor
            let tempImage       = scaleImage(eyeImage, toScale: 0.5).withRenderingMode(.alwaysTemplate)
            eyeButton.setImage(tempImage, for: .selected)
        }
    }
    
    func updateCloseEyeImage() {
        
        if let closeEyeImage = closeEyeImage {
            
            let tempImage       = scaleImage(closeEyeImage, toScale: 0.5)
            eyeButton.setImage(tempImage, for: UIControlState())
        }
    }

}
