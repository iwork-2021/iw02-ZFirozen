//
//  ZodoItemViewController.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/30.
//

import UIKit

class ZodoItemViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var statusSelect: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doneButton.isEnabled = false
    }
    
    @IBAction func cancle(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

extension ZodoItemViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let newText = oldText.replacingCharacters(in: Range(range, in:oldText)!, with: string)
        doneButton.isEnabled = !newText.isEmpty
        return true
    }
}
