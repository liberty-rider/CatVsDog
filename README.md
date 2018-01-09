![Liberty Rider](https://github.com/liberty-rider/angel-ios/blob/integration/header.png?raw=true)

CatsNdogs
=========================

This is the main repository for the CatsNdogs, a CoreML iOS demo iOS app by Liberty Rider.
Open the project with Xcode 9+

## Introduction



## Good to know
**Why don't use the built-in vision API or a [provided embedded vision model](https://developer.apple.com/machine-learning/)?**

First of all, this project is just a demo demonstrating the workflow between a datascientist and a mobile developer. Its goal is to show the problematics between these two worlds. They both use different languages such as Python and Swift and different vocabulary and visions of coding, often creating misunderstanding between them. CoreML has been built to create an easy bridge between these worlds. According to Apple,  `Core ML delivers blazingly fast performance with easy integration of machine learning models enabling you to build apps with intelligent new features using just a few lines of code.``

Besides, in many cases, an embedded vision model is heavy and rarely matches the exact purpose of your app. For example, the provided VGG16 model weighs more than half a giga.  This demo app just wants to distinguich cats and dogs, that's it, no more details. So our datascientist created a lightweight model with a database of two thousand pics of dogs and cats.
To reach at least a precision of 80%, it may need hours of training depending of your hardware configuration to compute the weights of our data model. But finally, the model is just 5MB!

At Liberty Rider we built a unique model processing accelerometer computed features and able to detect an accident. 


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
