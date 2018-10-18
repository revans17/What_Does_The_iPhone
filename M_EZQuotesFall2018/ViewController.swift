//
//  ViewController.swift
//  M_EZQuotesFall2018
//
//  Created by Ryan Evans on 9/17/18.
//  Copyright © 2018 Evans Org. All rights reserved.
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
        let animalOne = Animals(animal: "Fish")
        animalOne.image = UIImage(named: "Fish.jpg")!
        animalOne.animalLink = "https://en.wikipedia.org/wiki/Fish"
        animalOne.animalSound = try?
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "fishBlub", ofType: "wav")!))
        animalsArray.append(animalOne)
        let animalTwo = Animals(animal: "Seal")
        animalTwo.image = UIImage(named: "Seal.jpg")!
        animalTwo.animalLink = "https://en.wikipedia.org/wiki/Seal"
        animalTwo.animalSound = try?
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "sealOw", ofType: "wav")!))
        animalsArray.append(animalTwo)
        let animalThree = Animals(animal: "Dog")
        animalThree.image = UIImage(named: "Dog.jpg")!
        animalThree.animalLink = "https://en.wikipedia.org/wiki/Dog"
        animalThree.animalSound = try?
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "dogWolf", ofType: "wav")!))
        animalsArray.append(animalThree)
        let animalFour = Animals(animal: "Fox")
        animalFour.image = UIImage(named: "Fox.jpg")!
        animalFour.animalLink = "https://en.wikipedia.org/wiki/Fox"
        animalFour.animalSound = try?
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "foxDing", ofType: "wav")!))
        animalsArray.append(animalFour)
        let animalFive = Animals(animal: "Cat")
        animalFive.image = UIImage(named: "Cat.jpg")!
        animalFive.animalLink = "https://en.wikipedia.org/wiki/Cat"
        animalFive.animalSound = try?
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "catMeow", ofType: "wav")!))
        animalsArray.append(animalFive)
        let animalSix = Animals(animal: "Elephant")
        animalSix.image = UIImage(named: "Elephant.jpg")!
        animalSix.animalLink = "https://en.wikipedia.org/wiki/Elephant"
        animalSix.animalSound = try?
            AVAudioPlayer(contentsOf:
                URL(fileURLWithPath: Bundle.main.path(forResource: "elephantToot", ofType: "wav")!))
        animalsArray.append(animalFive) 
    }
    
    func setLabels(){
        let selectedAnimal = animalsArray.randomElement()
        lblName.text = selectedAnimal?.animalName
        lblName.textColor = selectedAnimal?.nameColor
        selectedAnimal?.animalSound.play()
        imgAuthor.image = selectedAnimal?.image
    }
    
    @IBAction func Press(_ sender: Any) {
        let url = URL(string: "https://en.wikipedia.org/wiki/" + lblName.text!)!
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
        setLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

