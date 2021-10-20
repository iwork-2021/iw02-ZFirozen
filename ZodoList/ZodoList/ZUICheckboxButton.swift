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
        setTitleColor(UIColor.blue, for: .normal)
        backgroundColor = UIColor.white
        let minSizeLength = min(frame.height, frame.width)
        layer.frame.size = CGSize(width: minSizeLength, height: minSizeLength)
        layer.cornerRadius = min(frame.height, frame.width) / 2
        addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func checkboxButtonTapped() {
        if isChecked {
            isChecked = false
            setTitle(nil, for: .normal)
            setTitleColor(UIColor.blue, for: .normal)
            backgroundColor = UIColor.white
        } else {
            isChecked = true
            setTitle("✓", for: .normal)
            setTitleColor(UIColor.white, for: .normal)
            backgroundColor = UIColor.green
        }
    }
}
