//
//  Predictor.swift
//  CatVsDog
//
//  Created by Mathieu Vandeginste on 21/01/2018.
//  Copyright © 2018 LibertyRider. All rights reserved.
//

import CoreML
import UIKit

class Predictor {
    
    private let model = CatVsDog()
    private let size = CGSize(width: 150, height: 150)
    
    func predict(image: UIImage) -> (Prediction, Int) {
        do {
            guard let resizedImage = image.resize(toSize: self.size), let pixelBuffer = resizedImage.toCVPixelBuffer() else { return (.unknown, 0) }
            let output = try self.model.prediction(image: pixelBuffer)
            guard let prediction = output.species[0] as? Double else { return (.unknown, 0) }
            let percent = self.convertPredictionToPercent(prediction: prediction)
            switch prediction {
            case 0..<0.25:
                return (.cat, percent)
            case 0.25..<0.75:
                return (.unknown, 0)
            default:
                return (.dog, percent)
            }
        } catch {
            print("Error while doing predictions: \(error)")
            return (.unknown, 0)
        }
    }
    
    func convertPredictionToPercent(prediction: Double) -> Int {
        if prediction < 0.25 { // Cat
            return Int(100 - (prediction / 0.25 * 100))
        } else { // Dog
            return Int( 100 - ((1 - prediction) / 0.25 * 100) )
        }
    }
    
}
