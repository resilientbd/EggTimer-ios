//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTime = ["Soft":3,"Medium":7,"Hard":12]
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    var secondsRemaining = 60
    var totalTime = 0
    var timer = Timer()
    @IBAction func keyPressed(_ sender: UIButton) {
        let title  = sender.currentTitle!
        secondsRemaining = eggTime[title]!
        totalTime = eggTime[title]!
        timer.invalidate()
        
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        titleText.text = "Please Wait..."
        progressBar.progress = 0
    }
    
    @objc func updateTimer()
    {
        if(secondsRemaining>=0)
        {
            let secondProgress = totalTime - secondsRemaining
            let percentageProgress  = calculateProgress(total: totalTime, value: secondProgress)
            print("\(secondsRemaining) Seconds.")
            print("\(percentageProgress) % progress.")
            progressBar.progress = percentageProgress
            secondsRemaining -= 1
        }
        else{
            timer.invalidate()
            titleText.text = "DONE"
        }
    }
    
    func calculateProgress(total:Int,value:Int) -> Float {
        return ((Float(value)*Float(100))/Float(total))/Float(100)
    }
    
}
