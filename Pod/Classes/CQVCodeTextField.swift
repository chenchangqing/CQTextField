//
//  CQVCodeTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

public class CQVCodeTextField: CQCutLineTextField {
    
    // 发送短信按钮
    private let sendSMSButton =  UIButton()
    private let sendSMSBtnTextColor = UIColor.grayColor()
    
    // 倒计时文本
    private let countDownLabel = UILabel()
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // 修改默认图标
        iconImage = UIImage(named: "\(CQTextFieldFrameworkSrcName)email_minimal_64px.png")
        placeholder = "请输入短信验证码"
        
        // 发送短信按钮
        sendSMSButton.setTitle("点击获取", forState: .Normal)
        sendSMSButton.setTitleColor(sendSMSBtnTextColor, forState: .Normal)
        sendSMSButton.titleLabel?.font = UIFont.systemFontOfSize(textFieldFont)
        sendSMSButton.frame = rightView.bounds
        rightView.addSubview(sendSMSButton)
        
        // 倒计时文本
        countDownLabel.frame = rightView.bounds
        countDownLabel.font = UIFont.systemFontOfSize(textFieldFont)
        countDownLabel.text = "59秒"
        countDownLabel.textAlignment = .Center
        countDownLabel.backgroundColor = UIColor.whiteColor()
        countDownLabel.textColor = sendSMSBtnTextColor
        rightView.addSubview(countDownLabel)
    }

}
