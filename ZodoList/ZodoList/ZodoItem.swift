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

/*
class ZodoTheme: NSObject, Encodable, Decodable {
    var foregroundColor: UIColor
    var backgroundColor: UIColor
    var backgroundImage: UIImage
    
    init(foregroundColor: UIColor, backgroundColor: UIColor, backgroundImage: UIImage) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.backgroundImage = backgroundImage
    }
}
 */
