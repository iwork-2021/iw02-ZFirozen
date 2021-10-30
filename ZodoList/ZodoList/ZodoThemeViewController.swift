//
//  ZodoThemeViewController.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/30.
//

import UIKit

protocol ThemeSelectDelegate {
    func ThemeSelect(backgroundColor: UIColor, foregroundColor: UIColor)
}

class ZodoThemeViewController: UIViewController {
    
    var themeSelectDelegate: ThemeSelectDelegate?
    var backgroundColor: UIColor = UIColor.white
    var foregroundColor: UIColor = UIColor.black
    var backgroundImage: UIImage?
    @IBOutlet weak var textColorSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.foregroundColor == UIColor.black {
            self.textColorSelector.selectedSegmentIndex = 1
        } else if self.foregroundColor == UIColor.white {
            self.textColorSelector.selectedSegmentIndex = 0
        }
        self.navigationController?.navigationBar.tintColor = UIColor.link
    }
    
    @IBAction func setColorSelected(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "white": fallthrough
        case "systemTeal": fallthrough
        case "systemYellow": foregroundColor = UIColor.black
            textColorSelector.selectedSegmentIndex = 1
        case "darkGray": fallthrough
        case "systemOrange": fallthrough
        case "customPink": foregroundColor = UIColor.white
            textColorSelector.selectedSegmentIndex = 0
        default: foregroundColor = UIColor.black
            textColorSelector.selectedSegmentIndex = 1
        }
        backgroundColor = sender.backgroundColor ?? UIColor.white
        backgroundImage = nil
    }
    
    @IBAction func save(_ sender: Any) {
        if self.textColorSelector.selectedSegmentIndex == 1 {
            foregroundColor = UIColor.black
        } else {
            foregroundColor = UIColor.white
        }
        self.themeSelectDelegate?.ThemeSelect(backgroundColor: backgroundColor, foregroundColor: foregroundColor)
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
