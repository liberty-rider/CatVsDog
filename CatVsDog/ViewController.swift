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
    
    // @IBOutlets
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var imageView: CornerRadiusImageView!
    @IBOutlet weak var predictButton: UIButton!
    
    // App lifecycle methods
    
    
    // @IBActions
    @IBAction func takePicture(_ sender: Any) {
    }
    
    @IBAction func predict(_ sender: Any) {
    }
    
    @IBAction func share(_ sender: Any) {
        let alert = UIAlertController(title: "Help", message: "Read the code and know more about deep learning on Github or visit our website!", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Help on Github", style: .default, handler: { (action) in
            UIApplication.shared.open(URL(string: "https://github.com/liberty-rider/CatVsDog")!, options: [:], completionHandler: nil)
        }))
        alert.addAction(UIAlertAction(title: "Liberty Rider" , style: .default, handler: { (action) in
            UIApplication.shared.open(URL(string: "https://www.liberty-rider.com")!, options: [:], completionHandler: nil)
        }))
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    // UIImagePickerControllerDelegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    }
    
}

