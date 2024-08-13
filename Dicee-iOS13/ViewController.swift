//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    // Map the numbers to the corresponding dice image names
    let diceImages = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    let maxPoints = 100
    
    var pointCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set everything to defaults
        textLabel.text = ""
        pointCounter = 0;
        pointsLabel.text = "\(pointCounter)"

        diceImageViewOne.image =  UIImage(imageLiteralResourceName: diceImages[Int.random(in: 0...5)])
        diceImageViewTwo.image = UIImage(imageLiteralResourceName: diceImages[Int.random(in: 0...5)])
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Roll button tapped. Rolling dice...")
        
        // Generate two random numbers
        let firstRandomNumber = Int.random(in: 0...5)
        let secondRandomNumber = Int.random(in: 0...5)
        print("Dice One:\(firstRandomNumber + 1) \nDice Two:\(secondRandomNumber + 1)")
          
        diceImageViewOne.image = UIImage(imageLiteralResourceName: diceImages[firstRandomNumber])
        diceImageViewTwo.image = UIImage(imageLiteralResourceName: diceImages[secondRandomNumber])
        
        if firstRandomNumber == secondRandomNumber {
            if firstRandomNumber == 5 {
                textLabel.text = "6. 6. Impressive!"
                pointCounter += 12 //double points on 6s
            } else {
                textLabel.text = "You rolled a double!"
                pointCounter += (firstRandomNumber + 1)
            }
            pointsLabel.text = "\(pointCounter)"
        } else {
            textLabel.text = ""
        }
        
        if pointCounter > maxPoints {
            // Create the alert
            let alert = UIAlertController(title: "Congratulations!", message: "That's a lotta points! You win!", preferredStyle: .alert)
            
            // Add an action to the alert
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
                // Reset the points here
                pointCounter = 0
                pointsLabel.text = "\(pointCounter)"
                textLabel.text = ""
                print("Points reset to zero.")
            }))
            
            // Present the alert
            present(alert, animated: true, completion: nil)
        }
        
    }
    
}

