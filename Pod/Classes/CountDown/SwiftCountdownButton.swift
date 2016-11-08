//
//  SwiftCountdownButton.swift
//  SwiftCountdownButtonExample
//
//  Created by Gesen on 15/6/4.
//  Copyright (c) 2015年 Gesen. All rights reserved.
//

import UIKit

open class SwiftCountdownButton: UIButton {

    // MARK: Properties
    
    open var maxSecond = 60
    open var countdown = false {
        didSet {
            if oldValue != countdown {
                countdown ? startCountdown() : stopCountdown()
            }
        }
    }
    
    fileprivate var second = 0
    fileprivate var timer: Timer?
    
    fileprivate var timeLabel: UILabel!
    fileprivate var normalText: String!
    fileprivate var normalTextColor: UIColor!
    fileprivate var disabledText: String!
    fileprivate var disabledTextColor: UIColor!
    
    // MARK: Life Cycle
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }
    
    deinit {
        countdown = false
    }
    
    // MARK: Setups
    
    fileprivate func setupLabel() {
        normalText = title(for: UIControlState())!
        disabledText = title(for: .disabled)!
        normalTextColor = titleColor(for: UIControlState())!
        disabledTextColor = titleColor(for: .disabled)!
        setTitle("", for: UIControlState())
        setTitle("", for: .disabled)
        timeLabel = UILabel(frame: bounds)
        timeLabel.textAlignment = .center
        timeLabel.font = titleLabel?.font
        timeLabel.textColor = normalTextColor
        timeLabel.text = normalText
        addSubview(timeLabel)
    }
    
    // MARK: Private
    
    fileprivate func startCountdown() {
        second = maxSecond
        updateDisabled()
        
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SwiftCountdownButton.updateCountdown), userInfo: nil, repeats: true)
    }
    
    fileprivate func stopCountdown() {
        timer?.invalidate()
        timer = nil
        updateNormal()
    }
    
    fileprivate func updateNormal() {
        isEnabled = true
        timeLabel.textColor = normalTextColor
        timeLabel.text = normalText
    }
    
    fileprivate func updateDisabled() {
        isEnabled = false
        timeLabel.textColor = disabledTextColor
        timeLabel.text = disabledText.replacingOccurrences(of: "second", with: "\(second)", options: .literal, range: nil)
    }
    
    @objc fileprivate func updateCountdown() {
        second = second - 1;
        if second <= 0 {
            countdown = false
        } else {
            updateDisabled()
        }
    }

}
