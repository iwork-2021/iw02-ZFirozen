//
//  ZUIIsDoneButton.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/20.
//

import UIKit

class ZUIIsDoneButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var isDone: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        reversesTitleShadowWhenHighlighted = true
        setTitle(nil, for: .normal)
        setTitleColor(UIColor.clear, for: .normal)
        backgroundColor = UIColor.clear
        let minSizeLength = min(frame.height, frame.width)
        layer.frame.size = CGSize(width: minSizeLength, height: minSizeLength)
        layer.cornerRadius = min(frame.height, frame.width) / 2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        reversesTitleShadowWhenHighlighted = true
        setTitle(nil, for: .normal)
        setTitleColor(UIColor.clear, for: .normal)
        backgroundColor = UIColor.clear
        let minSizeLength = min(frame.height, frame.width)
        layer.frame.size = CGSize(width: minSizeLength, height: minSizeLength)
        layer.cornerRadius = min(frame.height, frame.width) / 2
    }
    
    func statusUpdate(newStatus: Bool) {
        if newStatus {
            isDone = true
            setTitle("✓", for: .normal)
            setTitleColor(UIColor.white, for: .normal)
            backgroundColor = UIColor.clear
        } else {
            isDone = false
            setTitle(nil, for: .normal)
            setTitleColor(UIColor.clear, for: .normal)
            backgroundColor = UIColor.clear
        }
    }
}
