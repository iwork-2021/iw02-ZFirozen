//
//  ZodoTableViewCell.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/20.
//

import UIKit

class ZodoTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var status: ZUIIsDoneButton!
    var isDone: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStatus(doneStatus: Bool, textColor: UIColor) {
        if doneStatus != isDone {
            self.isDone = doneStatus
            self.status.statusUpdate(newStatus: isDone)
            if isDone {
                self.title.textColor = UIColor.white
                self.backgroundColor = UIColor.systemGreen
                self.tintColor = UIColor.white
            } else {
                self.title.textColor = textColor
                self.backgroundColor = UIColor.clear
                if textColor == UIColor.black {
                    self.tintColor = UIColor.link
                } else {
                    self.tintColor = UIColor.white
                }
            }
        } else {
            if isDone {
                self.title.textColor = UIColor.white
            } else {
                self.title.textColor = textColor
            }
        }
    }

}
