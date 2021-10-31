//
//  ZodoImagePickerViewController.swift
//  ZodoList
//
//  Created by ZFirozen on 2021/10/31.
//

import UIKit

protocol ImagePickerDelegate {
    func imageSelected(newImage: UIImage)
}

class ZodoImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    lazy var imageView: UIImageView = UIImageView(frame: view.frame)
    var imagePickerDelegate: ImagePickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(newImageSelected)),
            UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(selectAnotherImage))
            ]
        navigationItem.rightBarButtonItems?[0].isEnabled = false
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func selectAnotherImage() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func newImageSelected() {
        self.imagePickerDelegate?.imageSelected(newImage: self.imageView.image!)
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                fatalError("Error: did not picked a photo")
            }
            picker.dismiss(animated: true) { [unowned self] in
                // add a image view on self.view
                navigationItem.rightBarButtonItems?[0].isEnabled = true
                self.imageView.image = selectedImage
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            navigationItem.rightBarButtonItems?[0].isEnabled = (self.imageView.image != nil)
            picker.dismiss(animated: true, completion: nil)
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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

}
