//
//  ZodoItem.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/30.
//

import UIKit

class ZodoItem: NSObject {
    var title: String
    var isChecked: Bool
    
    init(title: String, isChecked: Bool) {
        self.isChecked = isChecked
        self.title = title
    }
}
