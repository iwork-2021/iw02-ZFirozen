//
//  ZodoItemViewController.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/30.
//

import UIKit

protocol AddItemDelegate {
    func addItem(item: ZodoItem)
}

protocol EditItemDelegate {
    func editItem(newItem: ZodoItem, itemIndex: Int)
}

class ZodoItemViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var statusSelect: UISegmentedControl!
    
    var addItemDelegate: AddItemDelegate?
    var editItemDelegate: EditItemDelegate?
    var itemToEdit: ZodoItem?
    var itemIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doneButton.isEnabled = false
        if itemToEdit != nil {
            doneButton.isEnabled = true
            var segmentSelect: Int = 0
            if itemToEdit!.isDone {
                segmentSelect = 1
            }
            self.titleInput.text! = itemToEdit!.title
            self.statusSelect.selectedSegmentIndex = segmentSelect
        }
    }
    
    @IBAction func cancle(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        if itemToEdit == nil {
            self.addItemDelegate?.addItem(item: ZodoItem(title: titleInput.text!, isDone: statusSelect.selectedSegmentIndex == 1))
        } else {
            self.editItemDelegate?.editItem(newItem: ZodoItem(title: titleInput.text!, isDone: statusSelect.selectedSegmentIndex == 1), itemIndex: self.itemIndex)
        }
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
