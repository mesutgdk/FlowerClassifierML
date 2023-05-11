//
//  ViewController.swift
//  FlowerClassifierML
//
//  Created by Mesut Gedik on 11.05.2023.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let userPickedImage = info[UIImagePickerController.InfoKey.originalImage]
        
        imageView.image = userPickedImage as? UIImage
        
        dismiss(animated: true,completion: nil)
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true)
        
    }
    
}

