//
//  ViewController.swift
//  BullsEyes
//
//  Created by Karan Sagar on 25/03/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Instance Scope Variable
    var currentSliderValue:Int = 0
    
    @IBOutlet weak var slider: UISlider!
    
    //target value
    var targetValue:Int = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.'
        
        currentSliderValue = lroundf(slider.value)
        startNewRound()
    }
    
    //Updated all the labels
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    //Start a new Round
    func startNewRound()  {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentSliderValue = 50
        slider.value  = Float(currentSliderValue)
        updateLabels()
    }
    
    

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("value of the slider is \(slider.value)")
        currentSliderValue = lroundf(slider.value)
    }
    
    
    @IBAction func hitme() {
        
        let valueMessage = "your current value is \(currentSliderValue) \nThe target value is \(targetValue) "
        
        
        let alert = UIAlertController(title: "Hey Gamer !", message: valueMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }

}

