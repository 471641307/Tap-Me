//
//  ViewController.swift
//  Tap Me
//  主界面
//  Created by Strai on 15/11/20.
//  Copyright © 2015年 泛华金融. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var timerLabel : UILabel!
    
    var count = 0
    var seconds = 0
    var timer = NSTimer()
    
// MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGame()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_tile.png")!)
        scoreLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_score.png")!)
        timerLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_time.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

// MARK: - action
    @IBAction func buttonAction() {
        NSLog("button press");
        count++
        scoreLabel.text = "Score \n \(count)"
    }
    
//MARK: - private method
    func setupGame() {
        seconds = 30
        count = 0
        timerLabel.text = "Time:\(seconds)"
        scoreLabel.text = "Score:\n \(count)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtraceTime"), userInfo: nil, repeats: true)
    }
    
    func subtraceTime() {
        seconds--
        timerLabel.text = "Time:\(seconds)"
        if(seconds == 0){
            timer.invalidate()
            let alert = UIAlertController(title: "play again", message: "you scored \(count) points", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "play again", style: UIAlertActionStyle.Default, handler: {
                action in self.setupGame()
            }))
            presentViewController(alert, animated: true, completion: { () -> Void in
                NSLog("alert has showed")
            })
        }
    }
}

