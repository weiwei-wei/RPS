//
//  EndViewController.swift
//  RockPaperScissors
//
//  Created by Wei Wu on 9/15/14.
//  Copyright (c) 2014 Wei. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class EndViewController: AdDelegate {
    
    @IBOutlet weak var Restart: UIButton!
     var Level : Int!
    var stage: Int!
    
    @IBOutlet weak var LevelText: UILabel!
    @IBAction func Start(sender: AnyObject) {
        performSegueWithIdentifier("Restart", sender: self)
    }
    
    
    @IBOutlet weak var Speech: UILabel!
    
    @IBOutlet weak var White0: UIImageView!
    
    @IBOutlet weak var White1: UIImageView!
    
    @IBOutlet weak var White2: UIImageView!
    
    @IBOutlet weak var White3: UIImageView!
    
    @IBOutlet weak var White4: UIImageView!
    
    @IBOutlet weak var White5: UIImageView!
    
    var a : Int!
    override func viewDidLoad() {
        //self.canDisplayBannerAds = true
        super.viewDidLoad()
        LevelText.text = "Score: \(Level)"
        if Level <= 7
        {
            stage = 1
        }
        else if Level <= 14
        {
            stage = 2
        }
        else if Level <= 21
        {
            stage = 3
        }
        else
        {
            stage = 4
        }
        
        if stage == 1
        {
            White0.hidden = false
            Speech.text = "Oh! That's not good... Try again!"
        }
        else if stage == 2
        {
            White1.hidden = false
            Speech.text = "That's not bad! If you could make it even better, you will see  my angelic smile!"
        }
        else if stage == 3
        {
            White1.hidden = false
            Speech.text = "I'm facial paralysis. You must be disappointed! Haha, just kidding, you are not seeing my smile because you are still not good enough!"
        }
        else if stage == 4
        {
            White1.hidden = false
            Speech.text = "OK, you are doing good! I will give you a smile. Watch!"
        
            
            var timer : NSTimer
            timer = NSTimer(timeInterval: 1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer, forMode: "NSDefaultRunLoopMode")
            a = 0
        }
    }
    func update()
    {
        a = a + 1
        if a == 1
        {
            White1.hidden = true
            White2.hidden = false
        }
        else if a == 2
        {
            White2.hidden = true
            White3.hidden = false
        }
        else if a == 3
        {
            White3.hidden = true
            White4.hidden = false
        }
        else if a == 4
        {
            White4.hidden = true
            White5.hidden = false
        }
    }
    
}