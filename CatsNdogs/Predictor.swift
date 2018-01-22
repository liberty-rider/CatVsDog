//
//  Predictor.swift
//  CatsNdogs
//
//  Created by Mathieu Vandeginste on 21/01/2018.
//  Copyright © 2018 LibertyRider. All rights reserved.
//

import CoreML
import UIKit

class Predictor {
    
    enum Species: Int {
        case cat = 0, dog
    }
    
    private let model = CatAndDog()
    private let size = CGSize(width: 150, height: 150)
    
    private func resize(image: UIImage, newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func predict(image: UIImage) -> Species? {
        do {
            guard let resizedImage = self.resize(image: image, newSize: self.size), let pixelBuffer = resizedImage.toCVPixelBuffer() else { return nil }
            let output = try self.model.prediction(image: pixelBuffer)
            guard let prediction = output.output1[0] as? Int else { print("prediction is nil"); return nil }
            return Species(rawValue: prediction)
        } catch {
            print("Error while doing predictions: \(error)")
            return nil
        }
    }
    
}
