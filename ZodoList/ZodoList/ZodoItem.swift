//
//  ZodoItem.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/30.
//

import UIKit

class ZodoItem: NSObject, Encodable, Decodable {
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.isDone = isDone
        self.title = title
    }
}
