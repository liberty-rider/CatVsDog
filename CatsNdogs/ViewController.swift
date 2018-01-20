//
//  ViewController.swift
//  CatsNdogs
//
//  Created by Mathieu Vandeginste on 08/01/2018.
//  Copyright © 2018 LibertyRider. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    private let imagePicker = UIImagePickerController()
    
    private enum Prediction: String {
        case cat = "🐱 It's a cat!"
        case dog = "🐶 It's a dog!"
        case unknown = "Press the paw to predict"
    }
    
    private var prediction: Prediction = .unknown {
        didSet {
            self.predictionLabel.text = self.prediction.rawValue
        }
    }
    
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var imageView: CornerRadiusImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        self.prediction = .unknown
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let collectionVC = segue.destination as? CollectionViewController else { return }
        collectionVC.vc = self
    }
    
    @IBAction func takePicture(_ sender: Any) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        self.imagePicker.sourceType = .camera
        self.imagePicker.cameraDevice = .rear
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func predict(_ sender: Any) {
    }
    
    // UIImagePickerControllerDelegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.imageView.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    
    
}

