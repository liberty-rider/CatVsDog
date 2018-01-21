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
    
    enum Species {
        case dog
        case cat
    }
    
    
    private let model = CatOrDogNeuralNetwork()
    private let size = CGSize(width: 150, height: 150)
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func preprocess(image: UIImage) -> MLMultiArray? {
        
        guard let resizedImage = self.resize(image: image, newSize: self.size) else { return nil }
        
        let dataSize = size.width * size.height * 4
            var pixelData = [UInt8](repeating: 0, count: Int(dataSize))
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let context = CGContext(data: &pixelData,
                                    width: Int(size.width),
                                    height: Int(size.height),
                                    bitsPerComponent: 8,
                                    bytesPerRow: 4 * Int(size.width),
                                    space: colorSpace,
                                    bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)
            guard let cgImage = self.cgImage else { return nil }
            context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            
            return pixelData
        }
        
        
        guard let array = try? MLMultiArray(shape: [3, 299, 299], dataType: .double) else {
            return nil
        }
        
        return array
    }
    
    func predict(image: UIImage) -> Species? {
        do {
            guard let resizedImage = self.resize(image: image, newSize: self.size), let pixelBuffer = image.toCVPixelBuffer() else { return nil }
           
            
//            self.model.prediction(input: <#T##CatOrDogNeuralNetworkInput#>)
//            let prediction = try self.model.prediction(data: pixelBuffer)
//            if prediction.species[0].intValue == 1 {
//                return .dog
//            } else {
//                return .cat
//            }
        } catch {
            print("Error while doing predictions: \(error)")
        }
        
        return nil
    }
    
}
