//
//  CQCutLineTextField.swift
//  Pods
//
//  Created by green on 15/12/17.
//
//

import UIKit

@IBDesignable open class CQCutLineTextField: CQTextField {
    
    internal let rightView = UIView()
    internal let cutOffLineLayer = CAShapeLayer()
    
    // 右边视图
    internal let paddingRVAndText: CGFloat = 8
    @IBInspectable dynamic open var RVWidth: CGFloat = 80 {
        didSet {
            setNeedsDisplay()
        }
    }

    open override func draw(_ rect: CGRect) {

        super.draw(rect)
        
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
        cutOffLine.move(to: startPoint)
        cutOffLine.addLine(to: endPoint)
        cutOffLine.close()
        
        cutOffLineLayer.path = cutOffLine.cgPath
        cutOffLineLayer.frame = rect
        cutOffLineLayer.masksToBounds    = true
        cutOffLineLayer.strokeColor      = borderColor.cgColor
        cutOffLineLayer.lineWidth        = borderWidth
        cutOffLineLayer.strokeStart      = 0
        cutOffLineLayer.strokeEnd        = 1
        self.layer.addSublayer(cutOffLineLayer)
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "entering text" state.
     */
    open override func animateViewsForTextEntry() {
        
        super.animateViewsForTextEntry()
        cutOffLineLayer.strokeColor  = focusBorderColor.cgColor
    }
    
    /**
     Creates all the animations that are used to leave the textfield in the "display input text" state.
     */
    open override func animateViewsForTextDisplay() {
        
        super.animateViewsForTextDisplay()
        cutOffLineLayer.strokeColor  = borderColor.cgColor
    }

}
