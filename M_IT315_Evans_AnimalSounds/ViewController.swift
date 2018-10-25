//
//  ViewController.swift
//  M_EZQuotesFall2018
//
//  Created by Ryan Evans on 9/17/18.
//  Copyright © 2018 Evans Org. All rights reserved.
//“this App is developed as an educational project”. If any copyrighted materials are included in
//accordance to the multimedia fair use guidelines, a notice should be added and states that
//“certain materials are included under the fair use exemption of the U.S. Copyright Law and
//have been prepared according to the multimedia fair use guidelines and are restricted from further use”.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var imgAuthor: UIImageView!

    @IBOutlet weak var goTo: UIButton!
    
    @IBAction func btnGreet(_ sender: Any) {
        setLabels()
    }
    

    var animalsArray = [Animals]()
    func populateAnimalsArray() {
        let animalOne = Animals(animal: "Lion", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "LionSound", ofType: "wav")!)))
        animalOne.image = UIImage(named: "Lion.jpg")!
        animalOne.animalLink = "https://en.wikipedia.org/wiki/Lion"
                animalsArray.append(animalOne)
        let animalTwo = Animals(animal: "Seal", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "SealSound", ofType: "wav")!)))
        animalTwo.image = UIImage(named: "Seal.jpg")!
        animalTwo.animalLink = "https://en.wikipedia.org/wiki/Seal"
        animalsArray.append(animalTwo)
        let animalThree = Animals(animal: "Dog", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "DogBark", ofType: "wav")!)))
        animalThree.image = UIImage(named: "Dog.jpg")!
        animalThree.animalLink = "https://en.wikipedia.org/wiki/Dog"
        animalsArray.append(animalThree)
        let animalFour = Animals(animal: "Fox", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "FoxSound", ofType: "wav")!)))
        animalFour.image = UIImage(named: "Fox.jpg")!
        animalFour.animalLink = "https://en.wikipedia.org/wiki/Fox"
        animalsArray.append(animalFour)
        let animalFive = Animals(animal: "Cat", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "CatSounds", ofType: "wav")!)))
        animalFive.image = UIImage(named: "Cat.jpg")!
        animalFive.animalLink = "https://en.wikipedia.org/wiki/Cat"
        animalsArray.append(animalFive)
        let animalSix = Animals(animal: "Elephant", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "ElephantSound", ofType: "wav")!)))
        animalSix.image = UIImage(named: "Elephant.jpg")!
        animalSix.animalLink = "https://en.wikipedia.org/wiki/Elephant"
        animalsArray.append(animalSix)
        let animalSeven = Animals(animal: "Bird", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "BirdSound", ofType: "wav")!)))
        animalSeven.image = UIImage(named: "bird.jpg")!
        animalSeven.animalLink = "https://en.wikipedia.org/wiki/Bird"
        animalsArray.append(animalSeven)
        let animalEight = Animals(animal: "Cow", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "CowSound", ofType: "wav")!)))
        animalEight.image = UIImage(named: "cow.jpg")!
        animalEight.animalLink = "https://en.wikipedia.org/wiki/Cow"
        animalsArray.append(animalEight)
        let animalNine = Animals(animal: "Mouse", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "MouseSound", ofType: "wav")!)))
        animalNine.image = UIImage(named: "mouse.jpg")!
        animalNine.animalLink = "https://en.wikipedia.org/wiki/Mouse"
        animalsArray.append(animalNine)
        let animalTen = Animals(animal: "Duck", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "DuckSound", ofType: "wav")!)))
        animalTen.image = UIImage(named: "duck.jpg")!
        animalTen.animalLink = "https://en.wikipedia.org/wiki/Duck"
        animalsArray.append(animalTen)
        let animalEleven = Animals(animal: "Frog", sound:try!
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "FrogSound", ofType: "wav")!)))
        animalEleven.image = UIImage(named: "frog.jpg")!
        animalEleven.animalLink = "https://en.wikipedia.org/wiki/Frog"
        animalsArray.append(animalEleven)
    }
    var currentAnimalName = ""
    var randomNumber = Int(arc4random_uniform(11))
    
    func setLabels(){
        randomNumber = Int(arc4random_uniform(11))
        let selectedAnimal = animalsArray[randomNumber]
        currentAnimalName = selectedAnimal.animalName
        lblName.text = "This is a " + selectedAnimal.animalName + "\n Shake the phone to hear his sound."
        lblName.textColor = selectedAnimal.nameColor
        imgAuthor.image = selectedAnimal.image
    }
    func setLabelsWithSound(){
        let selectedAnimal = animalsArray[randomNumber]
        lblName.text = "This is a " + selectedAnimal.animalName
        selectedAnimal.animalSound.play()
        
    }
    
    @IBAction func Press(_ sender: Any) {
        let url = URL(string: "https://en.wikipedia.org/wiki/" + currentAnimalName)!
        UIApplication.shared.open(url, options: [:])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateAnimalsArray()
        setLabels()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        lblName.alpha = 0.0
        imgAuthor.alpha = 0.0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 3.0, animations:{
            self.lblName.alpha = 1.0
            self.imgAuthor.alpha = 1.0
        })
        setLabelsWithSound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

