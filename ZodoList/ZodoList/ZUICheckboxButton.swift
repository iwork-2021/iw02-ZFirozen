//
//  ZUICheckboxButton.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/20.
//

import UIKit

class ZUICheckboxButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var isChecked: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        reversesTitleShadowWhenHighlighted = true
        setTitle(nil, for: .normal)
        setTitleColor(UIColor.clear, for: .normal)
        backgroundColor = UIColor.clear
        let minSizeLength = min(frame.height, frame.width)
        layer.frame.size = CGSize(width: minSizeLength, height: minSizeLength)
        layer.cornerRadius = min(frame.height, frame.width) / 2
        addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
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
        addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
    }
    
    @IBAction func checkboxButtonTapped() {
        if isChecked {
            isChecked = false
            setTitle(nil, for: .normal)
            setTitleColor(UIColor.clear, for: .normal)
            backgroundColor = UIColor.clear
        } else {
            isChecked = true
            setTitle("✓", for: .normal)
            setTitleColor(UIColor.white, for: .normal)
            backgroundColor = UIColor.clear
        }
        print("touched!")
    }
}
