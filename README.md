![Liberty Rider](https://github.com/liberty-rider/angel-ios/blob/integration/header.png?raw=true)

CatsNdogs
=========================

This is the main repository for the CatsNdogs, a CoreML iOS demo iOS app by Liberty Rider.
Open the project with Xcode 9+

## Introduction
At Liberty Rider we built a unique model processing accelerometer computed features and able to detect an accident.

**Deep learning** is a subcategory of machine learning (such as decision trees, for example), more and more used nowadays in our apps. It consists in multiple layers in an artificial neural network. We first have to process the raw data (for Liberty Rider, accelerometer data, in our demo app, images of dogs and cats) into features. Those features are the input of our network and the output will be the prediction (accident? or in our demo cat 🐱 VS dog 🐶)
 **CoreML** is a framework provided by Apple since iOS 11 to easily integrate trained models built with other languages such as Python in our app. you can integrate trained machine learning models into your app.
 According to Apple,  `Core ML delivers blazingly fast performance with easy integration of machine learning models enabling you to build apps with intelligent new features using just a few lines of code.``

## Good to know
**Why don't use the [built-in vision API](https://developer.apple.com/documentation/vision) or a [provided embedded vision model](https://developer.apple.com/machine-learning/)?**

First of all, this project is just a demo demonstrating the workflow between a datascientist and a mobile developer. Its goal is to show the problematics between these two worlds. They both use different languages such as Python and Swift and different vocabulary and visions of coding, often creating misunderstanding between them. CoreML has been built to create an easy bridge between these worlds.

Besides, in many cases, an embedded vision model is heavy and rarely matches the exact purpose of your app. For example, the provided VGG16 model weighs more than half a giga.  This demo app just wants to distinguish cats and dogs, that's it, no more details. So our datascientist created a lightweight model with a database of two thousand pics of dogs and cats.
To reach at least a reliability of 80%, it may need hours of training depending of your hardware configuration to compute the weights for the neural network of our data model. But finally, the trained model is just 5MB!


## Python project - create, train and export the model

#### Requirements:
- a PC/Mac running Python
-

#### What you need to do:

## iOS project - import the trained model and predict

#### Requirements:
- a Mac running on macOS 10.11 or later
- the last stable version of [Xcode 9](https://developer.apple.com/xcode/)

#### What you need to do:

**1.** Clone the repository into your Developer folder
 - ```cd ~ ; mkdir Developer ; cd Developer```
 - ```git clone git@github.com:liberty-rider/angel-ios.git```
 - ```cd angel-ios```
  
**2.** Install cocoapods
  - ```brew install cocoapods```
  - ```pod install```

**3.** Open the app in Xcode and run the app
 - ```open CatsNdogs.xcworkspace/```
 - *That's all folks*, run the app onto your phone or an iOS simulator!
---

#### Useful links

- [Xcode 9+](https://developer.apple.com/xcode/)
- [Swift 4](https://swift.org/blog/swift-4-0-released/)
- [Cocoapods](https://cocoapods.org/)
