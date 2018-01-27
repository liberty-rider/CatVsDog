//
//  ViewController.swift
//  CatVsDog
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
    private let predictor = Predictor()
    
    private enum Prediction: String {
        case cat = "🐱 It's a cat!"
        case dog = "🐶 It's a dog!"
        case start = "Press the paw to predict"
        case unknown = "🐈 Sorry I couldn't guess...🐩"
    }
    
    private var prediction: Prediction = .start {
        didSet {
            self.predictionLabel.text = self.prediction.rawValue
            if self.prediction == .start {
                self.pulsator.start()
            }
        }
    }
    
    // @IBOutlets
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var imageView: CornerRadiusImageView!
    @IBOutlet weak var predictButton: UIButton!
    
    // App lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: "\(arc4random()%50).jpg")
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
        // Setup pulsator
        self.pulsator.backgroundColor = #colorLiteral(red: 0.577162385, green: 0.241209209, blue: 0.7712444663, alpha: 1)
        self.pulsator.numPulse = 4
        self.pulsator.radius = 80
        self.pulsator.animationDuration = 3
        self.view.layer.insertSublayer(self.pulsator, below: self.predictButton.layer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.setNeedsLayout()
        self.prediction = .start
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.pulsator.position = CGPoint(x: self.view.bounds.width / 2, y: self.predictButton.center.y)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.prediction = .start
        guard let collectionVC = segue.destination as? CollectionViewController else { return }
        collectionVC.vc = self
    }
    
    // @IBActions
    @IBAction func takePicture(_ sender: Any) {
        self.prediction = .start
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
        self.imagePicker.sourceType = .camera
        self.imagePicker.cameraDevice = .rear
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func predict(_ sender: Any) {
        self.pulsator.stop()
        guard let image = self.imageView.image else { return }
        let species = self.predictor.predict(image: image)
        if let prediction = species {
            self.prediction = (prediction == .cat) ? .cat : .dog
        } else {
            self.prediction = .unknown
        }
    }
    
    @IBAction func help(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://github.com/liberty-rider/CatVsDog")!, options: [:], completionHandler: nil)
    }
    
    // UIImagePickerControllerDelegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.imageView.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    
}

