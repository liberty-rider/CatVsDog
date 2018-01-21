//
//  ViewController.swift
//  CatsNdogs
//
//  Created by Mathieu Vandeginste on 08/01/2018.
//  Copyright © 2018 LibertyRider. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let imagePicker = UIImagePickerController()
    private var pulsator = Pulsator()
    
    private enum Prediction: String {
        case cat = "🐱 It's a cat!"
        case dog = "🐶 It's a dog!"
        case unknown = "Press the paw to predict"
    }
    
    private var prediction: Prediction = .unknown {
        didSet {
            self.predictionLabel.text = self.prediction.rawValue
            self.reliabilityLabel.isHidden = self.prediction == .unknown
        }
    }
    
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var reliabilityLabel: UILabel!
    @IBOutlet weak var imageView: CornerRadiusImageView!
    @IBOutlet weak var predictButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        self.prediction = .unknown
        // Setup pulsator
        self.pulsator.backgroundColor = UIColor(named: "myPurple")!.cgColor
        self.pulsator.numPulse = 4
        self.pulsator.radius = 80
        self.pulsator.animationDuration = 3
        self.view.layer.insertSublayer(self.pulsator, below: self.predictButton.layer)
        self.pulsator.start()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.pulsator.stop()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let collectionVC = segue.destination as? CollectionViewController else { return }
        collectionVC.vc = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.pulsator.position = CGPoint(x: self.view.bounds.width / 2, y: self.predictButton.center.y)
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

