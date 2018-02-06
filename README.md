![Liberty Rider](https://github.com/liberty-rider/CatVsDog/blob/master/header.png?raw=true)

🐱 CatVsDog 🐶
=========================

This is the main repository for the CatVsDog, a CoreML iOS demo app by Liberty Rider.
Open the project with Xcode 9+
![Screenshot](https://github.com/liberty-rider/CatsNdogs/blob/master/Screen.png?raw=true)

This project has been presented at the Toulouse Swift Meetup the 06/02/2018. [The slides of the presentation are in the repository.](https://github.com/liberty-rider/CatVsDog/blob/master/CoreML%20Meetup%20iOS%20by%20Liberty%20Rider.pdf)
The app **CatVsDog** is [available on the App Store](https://itunes.apple.com/fr/app/catvsdog-by-liberty-rider/id1341306528?mt=8) if you want to try it right now.


## Python project - create, train and export the model

#### Requirements:
- a PC/Mac running Python2.7 with Jupyter Notebook
- install the requirements:  ```pip install -r requirements.txt```
- launch the interactive python IDE: ```jupyter-notebook```
- open and run the getting-started.ipynb notebook file

## iOS project - import the trained model and predict

#### Requirements:
- a Mac running on macOS 10.11 or later
- the last stable version of [Xcode 9](https://developer.apple.com/xcode/)

#### What you need to do:
 - ```git clone https://github.com/liberty-rider/CatsNdogs.git```
 - ```cd CatsNdogs```
 - ```open CatsNdogs.xcodeproj/```
---

#### Useful links
- [CoreML](https://developer.apple.com/documentation/coreml)
- [FastAi](http://www.fast.ai/)
- [Awesome Machine Learning](https://github.com/josephmisiti/awesome-machine-learning)

## Good to know
 **CoreML** is a framework provided by Apple since iOS 11 to easily integrate trained models built with other languages such as Python in our app. you can integrate trained machine learning models into your app.
 According to Apple,  `Core ML delivers blazingly fast performance with easy integration of machine learning models enabling you to build apps with intelligent new features using just a few lines of code.`

**Why don't use the [built-in vision API](https://developer.apple.com/documentation/vision) or a [provided embedded vision model](https://developer.apple.com/machine-learning/)?**

First of all, this project is just a demo demonstrating the workflow between a datascientist and a mobile developer. Its goal is to point out the problematics between these two worlds. They both use different languages such as Python and Swift and different vocabulary and visions of coding, often creating misunderstanding between them. CoreML has been built to create an easy bridge between these worlds.

Besides, in many cases, an embedded vision model is heavy and rarely matches the exact purpose of your app. For example, the provided VGG16 model weighs more than half a giga.  This demo app just wants to distinguish cats and dogs, that's it, no more details. So our datascientist created a lightweight model with a database of two thousand pics of dogs and cats.
To reach at least a reliability of 80%, it may need few minutes to hours of training depending of your hardware configuration  to train the network with our data. Finally, the trained model is just 5MB!
