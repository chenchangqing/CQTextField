//
//  CQPWDTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

public class CQPWDTextField: CQCutLineTextField {
    
    // 密码可见按钮
    private let eyeButton = UIButton()
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // 修改默认图标 文字
        iconImage = UIImage(named: "\(CQTextFieldFrameworkSrcName)Password_64px.png")
        placeholder = "请设置登录密码"
        
        // 密码可见按钮
        var closeEyeImage   = UIImage(named: "\(CQTextFieldFrameworkSrcName)close_eye_50px.png")!
        var openEyeImage    = UIImage(named: "\(CQTextFieldFrameworkSrcName)open_eye_50px.png")!
        closeEyeImage   = scaleImage(closeEyeImage, toScale: 0.5)
        openEyeImage    = scaleImage(openEyeImage, toScale: 0.5)
        eyeButton.setImage(closeEyeImage, forState: .Normal)
        eyeButton.setImage(openEyeImage, forState: .Selected)
        eyeButton.frame = rightView.bounds
        rightView.addSubview(eyeButton)
    }

}
