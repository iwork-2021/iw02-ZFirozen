//
//  ZodoTableViewController.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/20.
//

import UIKit
import Photos

class ZodoTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var items:[ZodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        loadAllItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ZodoTableViewCell
        let item = items[indexPath.row]
        // Configure the cell...
        cell.title.text! = item.title
        cell.setStatus(doneStatus: item.isDone)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: ZodoTableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addItem" {
            let addItemViewController = segue.destination as! ZodoItemViewController
            addItemViewController.addItemDelegate = self
        } else if segue.identifier == "editItem" {
            let editItemViewController = segue.destination as! ZodoItemViewController
            let cell = sender as! ZodoTableViewCell
            var isDone: Bool
            isDone = cell.status.isDone
            let item = ZodoItem(title: cell.title.text!, isDone: isDone)
            editItemViewController.itemToEdit = item
            editItemViewController.itemIndex = tableView.indexPath(for: cell)!.row
            editItemViewController.editItemDelegate = self
        }
    }
    
    @IBAction func selectBackgroundImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            // picker.mediaTypes
            self.present(
                picker,
                animated: true,
                completion: nil
            )
        } else {
            let alert = UIAlertController(
                title: "Unable to Pick Image",
                message: "We couldn't start an image-picker. \nPlease check the permission settings.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                                title: "OK",
                                style: .default,
                                handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.tableView.backgroundView = UIImageView(image: (info[UIImagePickerController.InfoKey.originalImage] as! UIImage))
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension ZodoTableViewController: AddItemDelegate {
    func addItem(item: ZodoItem) {
        self.items.append(item)
        self.tableView.reloadData()
    }
}

extension ZodoTableViewController: EditItemDelegate {
    func editItem(newItem: ZodoItem, itemIndex: Int) {
        self.items[itemIndex] = newItem
        self.tableView.reloadData()
    }
}

extension ZodoTableViewController {
    func dataFilePath()->URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return path!.appendingPathComponent("ZodoItems.json")
    }
    
    func saveAllItems() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: dataFilePath(), options: .atomic)
        } catch {
            print("Error while saving task \(error.localizedDescription)")
        }
    }
    
    func loadAllItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            do {
                items = try JSONDecoder().decode([ZodoItem].self, from: data)
            } catch {
                print("Error while decoding list \(error.localizedDescription)")
            }
        }
    }
}
