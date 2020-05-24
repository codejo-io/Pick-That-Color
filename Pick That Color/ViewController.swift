//
//  ViewController.swift
//  Pick That Color
//
//  Created by Cole James on 5/22/20.
//  Copyright © 2020 Codejo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var optionOne: UIButton!
    @IBOutlet var optionTwo: UIButton!
    @IBOutlet var optionThree: UIButton!
    @IBOutlet var optionFour: UIButton!
    
    var buttons = [UIButton]()
    
    var correctButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttons = [optionOne, optionTwo, optionThree, optionFour]
        
        newGame()
    }
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        if sender == correctButton {
            statusLabel.text = "CORRECT!"
        } else {
            statusLabel.text = "INCORRECT!"
        }
        
        statusLabel.isHidden = false
    }
    
    @IBAction func startGame(_ sender: Any) {
        newGame()
    }
    
    func newGame() {
        statusLabel.isHidden = true
        
        for button in buttons {
            button.backgroundColor = UIColor(
                red: CGFloat.random(in: 0...1),
                green: CGFloat.random(in: 0...1),
                blue: CGFloat.random(in: 0...1),
                alpha: 1
            )
        }
        
        if let correctButton = buttons.randomElement() {
            let red = Int.random(in: 0...255)
            let green = Int.random(in: 0...255)
            let blue = Int.random(in: 0...255)
            
            redLabel.text = "RED: \(red)"
            greenLabel.text = "GREEN: \(green)"
            blueLabel.text = "BLUE: \(blue)"
            
            // Because UIColor wants a value between 0 and 1
            correctButton.backgroundColor = UIColor(
                red: CGFloat(red) / 255,
                green: CGFloat(green) / 255,
                blue: CGFloat(blue) / 255,
                alpha: 1
            )
            
            self.correctButton = correctButton
        }
    }

}

