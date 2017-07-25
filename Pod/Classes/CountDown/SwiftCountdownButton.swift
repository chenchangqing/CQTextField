//
//  SwiftCountdownButton.swift
//  SwiftCountdownButtonExample
//
//  Created by Gesen on 15/6/4.
//  Copyright (c) 2015年 Gesen. All rights reserved.
//

import UIKit

public class SwiftCountdownButton: UIButton {

    // MARK: Properties
    
    public var maxSecond = 60
    public var countdown = false {
        didSet {
            if oldValue != countdown {
                countdown ? startCountdown() : stopCountdown()
            }
        }
    }
    
    private var second = 0
    private var timer: Timer?
    
    private var timeLabel: UILabel!
    private var normalText: String!
    private var normalTextColor: UIColor!
    private var disabledText: String!
    private var disabledTextColor: UIColor!
    
    // MARK: Life Cycle
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
        
    }
    
    deinit {
        countdown = false
    }
    
    // MARK: Setups
    
    private func setupLabel() {
        
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
    
    private func startCountdown() {
        second = maxSecond
        updateDisabled()
        
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(SwiftCountdownButton.updateCountdown), userInfo: nil, repeats: true)
    }
    
    private func stopCountdown() {
        timer?.invalidate()
        timer = nil
        updateNormal()
    }
    
    private func updateNormal() {
        isEnabled = true
        timeLabel.textColor = normalTextColor
        timeLabel.text = normalText
    }
    
    private func updateDisabled() {
        isEnabled = false
        timeLabel.textColor = disabledTextColor
        
        timeLabel.text = disabledText.replacingOccurrences(of: "second", with: "\(second)", options: String.CompareOptions.literal, range: nil)
    }
    
    @objc private func updateCountdown() {
        second = second - 1;
        if second <= 0 {
            countdown = false
        } else {
            updateDisabled()
        }
    }

}
