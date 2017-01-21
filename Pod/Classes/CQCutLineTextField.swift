//
//  CQCutLineTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

@IBDesignable public class CQCutLineTextField: CQTextField {
    
    internal let rightView = UIView()
    internal let cutOffLineLayer = CAShapeLayer()
    
    // 右边视图
    internal let paddingRVAndText: CGFloat = 8
    @IBInspectable dynamic var RVWidth: CGFloat = 80 {
        didSet {
            setNeedsDisplay()
        }
    }

    override public func drawRect(rect: CGRect) {

        super.drawRect(rect)
        
        // 修改文本框长度
        let textFieldOX   = textField.frame.origin.x
        let textFieldSW   = rect.width - textFieldOX - RVWidth - paddingRVAndText
        let textFieldSize = CGSize(width: textFieldSW, height: textField.frame.height)
        textField.frame   = CGRect(origin: textField.frame.origin, size: textFieldSize)
        
        // 右边视图
        let rightViewOriginX = textField.frame.maxX + paddingRVAndText
        let rightViewOrigin  = CGPoint(x: rightViewOriginX, y: 0)
        let rightViewSize    = CGSize(width: RVWidth, height: rect.height)
        rightView.frame      = CGRect(origin: rightViewOrigin, size: rightViewSize)
        self.addSubview(rightView)
        
        // 分割线
        let startPointX = rightView.frame.origin.x
        let startPoint  = CGPoint(x: startPointX, y: 0)
        let endPoint    = CGPoint(x: startPointX, y: rect.height)
        let cutOffLine  = UIBezierPath()
        cutOffLine.moveToPoint(startPoint)
        cutOffLine.addLineToPoint(endPoint)
        cutOffLine.closePath()
        
        cutOffLineLayer.path = cutOffLine.CGPath
        cutOffLineLayer.frame = rect
        cutOffLineLayer.masksToBounds    = true
        cutOffLineLayer.strokeColor      = borderColor.CGColor
        cutOffLineLayer.lineWidth        = borderWidth
        cutOffLineLayer.strokeStart      = 0
        cutOffLineLayer.strokeEnd        = 1
        self.layer.addSublayer(cutOffLineLayer)
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "entering text" state.
     */
    override func animateViewsForTextEntry() {
        
        super.animateViewsForTextEntry()
        cutOffLineLayer.strokeColor  = focusBorderColor.CGColor
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "display input text" state.
     */
    override func animateViewsForTextDisplay() {
        
        super.animateViewsForTextDisplay()
        cutOffLineLayer.strokeColor  = borderColor.CGColor
    }

}
