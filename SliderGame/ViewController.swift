//
//  ViewController.swift
//  SliderGame
//
//  Created by Vladyslav Mi on 04.07.2024.
//

import UIKit

class ViewController: UIViewController {

    var sliderValue : Int = 0
    @IBOutlet var Slider : UISlider!
    @IBOutlet var targetLabel : UILabel!
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var roundLabel : UILabel!
    
    var targetValue = 0
    var score = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        newRound()
    }
    @IBAction func restart() {
        score = 0
        round = 1
        newRound()
    }
    
    func newRound() {
        
        targetValue = Int.random(in: 1...100)
        targetLabel.text = "\(targetValue)"
        roundLabel.text = "\(round)"
        scoreLabel.text = "\(score)"
        
    }
    @IBAction func showAlert(){
        let currentValue = lroundf(Slider.value)
        
        let difference = abs(currentValue - targetValue)
        let currentScore = 100 - difference
        
        let message = "Current value: \(currentValue) \n Difference : \(difference) \n Current Score : \(currentScore) "
        let alertWindow = UIAlertController(title: "Hey!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.newRound()
        }
        
        alertWindow.addAction(action)
        present(alertWindow, animated: true)
        
        score += currentScore
        round += 1
       
    }
//    @IBAction func SliderValueChaged(_ slider: UISlider) {
//        sliderValue = lroundf(slider.value)
//    }
}

