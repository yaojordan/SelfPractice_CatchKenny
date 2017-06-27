//
//  ViewController.swift
//  CatchKenny
//
//  Created by 姚宇鴻 on 2017/6/27.
//  Copyright © 2017年 JordanYao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var score = 0
    var counter = 0
    var timer = Timer()
    var hideTimer = Timer()
    var KennyArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scoreLabel.text = "Score: \(score)"
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        counter =30
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self,
                                         selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
        
        KennyArray.append(kenny1)
        KennyArray.append(kenny2)
        KennyArray.append(kenny3)
        KennyArray.append(kenny4)
        KennyArray.append(kenny5)
        KennyArray.append(kenny6)
        KennyArray.append(kenny7)
        KennyArray.append(kenny8)
        KennyArray.append(kenny9)


    }
    
    func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    func countDown(){
        counter -= 1
        timeLabel.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            let alert = UIAlertController(title: "Time", message: "Your time is up", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            let replay = UIAlertAction(title: "Replay", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                
                self.timeLabel.text = "\(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                             selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self,
                                                       selector: #selector(ViewController.hideKenny), userInfo: nil, repeats: true)
                
            })
            
            alert.addAction(replay)
        }
        
    }
    
    func hideKenny(){
        
        for kenny in KennyArray{
            kenny.isHidden = true
        }
        
        let randomNumber = Int(arc4random_uniform(UInt32(KennyArray.count-1)))
        KennyArray[randomNumber].isHidden = false
        
    }
    
    
    

}

