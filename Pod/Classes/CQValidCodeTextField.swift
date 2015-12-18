//
//  CQValidCodeTextField.swift
//  Pods
//
//  Created by green on 15/12/18.
//
//

import UIKit

@IBDesignable public class CQValidCodeTextField: CQCutLineTextField {

    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        iconImage = UIImage(named: "\(CQTextFieldFrameworkSrcName)email_minimal_64px.png")
    }

}
