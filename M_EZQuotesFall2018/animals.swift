//
//  animals.swift
//  M_EZQuotesFall2018
//
//  Created by Ryan Evans on 10/15/18.
//  Copyright © 2018 Evans Org. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
class Animals {
    var animalName:String
    var image:UIImage = UIImage()
    var nameColor:UIColor = UIColor(red:1, green:1, blue:1, alpha:1)
    var animalSound:AVAudioPlayer!
    var animalLink:String!
    

    
    init(animal:String) {
        animalName = animal
        setNameColor()
    }
    
    func setNameColor() {
        let randomRed = CGFloat(arc4random_uniform(255))
        let randomBlue = CGFloat(arc4random_uniform(255))
        let randomGreen = CGFloat(arc4random_uniform(255))
        let animalNameColor = UIColor(red:randomRed/255,
                                green:randomGreen/255,
                                blue:randomBlue/255,
                                alpha:1)
        nameColor = animalNameColor
    }

    
    
}
