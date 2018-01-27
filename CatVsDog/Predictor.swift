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
    
    private let model = CatVSDog()
    private let size = CGSize(width: 150, height: 150)
    
    func predict(image: UIImage) -> Species? {
        do {
            guard let resizedImage = image.resize(toSize: self.size), let pixelBuffer = resizedImage.toCVPixelBuffer() else { return nil }
            let output = try self.model.prediction(image: pixelBuffer)
            guard let prediction = output.output1[0] as? Int else { return nil }
            return Species(rawValue: prediction)
        } catch {
            print("Error while doing predictions: \(error)")
            return nil
        }
    }
    
}
