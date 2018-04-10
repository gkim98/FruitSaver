//
//  ViewController.swift
//  FruitSaverSwift
//
//  Created by Grant Kim on 4/9/18.
//  Copyright © 2018 Grant Kim. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // variable for fruit identified
    var fruitIdentified = ""
    var fruitPic = UIImage()
    
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var picMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }
    
    // user chose an image --> do something with it
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            fruitPic = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Can't convert to CIImage")
            }
            
            imagePicker.dismiss(animated: true, completion: nil)

            // sends image to be processed by CoreML
            detect(image: ciimage)
        }
    }
    
    func detect(image: CIImage) {
        
        // load Inception model
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading model failed")
        }
        
        // make a request to classify the photo
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Request failed")
            }
            
            if let firstResult = results.first {
                
                // put present fruit info here
                self.presentFruitInfo(fruit: firstResult.identifier)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    // brings up fruit info screen
    func presentFruitInfo(fruit: String) {
        var fruitFound = false
        
        // checks if picture is of a registered fruit
        for (oneFruit, _) in fruits {
            if(fruit.contains(oneFruit.lowercased())) {
                fruitIdentified = oneFruit
                performSegue(withIdentifier: "goToFruitInfo", sender: self)
                fruitFound = true
                break
            }
        }
        
        // gives feedback depending on if pic is registered
        picMessage.text = fruitFound ? "Take a produce pic to begin" : "Produce could not be identified"
    }
    
    // passes fruit to the fruit info view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToFruitInfo" {
            
            let fruitVC = segue.destination as! FruitInfoViewController
            
            fruitVC.fruitType = fruitIdentified
            fruitVC.fruitPicture = fruitPic
        }
    }

    // presents camera to the user
    @IBAction func cameraTapped(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    // button pressed for about page
    @IBAction func aboutPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAbout", sender: self)
    }
}

