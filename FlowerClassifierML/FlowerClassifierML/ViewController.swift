//
//  ViewController.swift
//  FlowerClassifierML
//
//  Created by Mesut Gedik on 11.05.2023.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var flowerLabel: UILabel!
    
    let wikiURL = "https://en.wikipedia.org/w/api.php"
    
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("cannot convert to CIImage")
            }
            
            detect(image: ciimage)
            
            imageView.image = userPickedImage
            
        }
        
        dismiss(animated: true,completion: nil)
    }
    
    func detect (image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("cannot import model")
        }
        
        let request = VNCoreMLRequest(model: model) { (request,error) in
            
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("couldnt classify image")
            }
//            print(request.results)
            
            self.navigationItem.title = classification.identifier.capitalized
            
            self.requestInfo(flowerName: classification.identifier)
            
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }catch{
            print(error)
        }
    }

    func requestInfo(flowerName:String){
        
        let parameters: [String:String] = [
            
            "format":"json",
            "action":"query",
            "prop":"extracts",
            "exintro":"",
            "explaintext":"",
            "titles": flowerName,
            "indexpageids":"",
            "redirects":"1"
        ]
        
        Alamofire.request(wikiURL,method: .get,parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print("Got wiki info")
//                print(JSON(response.result.value))
                
                let flowerJSON : JSON = JSON(response.result.value!)
//                print(flowerJSON)

                let pageids = flowerJSON["query"]["pageids"][0]
//                print(pageids)

                let flowerDescription = flowerJSON["query"]["pages"]["\(pageids)"]["extract"].stringValue
//                print(flowerDescription)
                self.flowerLabel.text = flowerDescription

                
//                print(self.flowerLabel.text!)
                
                
            }
        }
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true)
        
    }
    
}

