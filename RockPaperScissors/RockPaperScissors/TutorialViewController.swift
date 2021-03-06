//
//  TutorialViewController.swift
//  RockPaperScissors
//
//  Created by Wei Wu on 9/17/14.
//  Copyright (c) 2014 Wei. All rights reserved.
//

import UIKit
import SpriteKit
import GLKit
import iAd

class TutorialViewController: AdDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.canDisplayBannerAds = true
        
        
        var timer : NSTimer
        timer = NSTimer(timeInterval: 0.5, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: "NSDefaultRunLoopMode")
        a = 0

    }
    @IBAction func Proceed(sender: AnyObject) {
        performSegueWithIdentifier("t1", sender: self)
    }
    
    var a : Int!
    @IBOutlet weak var dog1: UIImageView!
    @IBOutlet weak var dog2: UIImageView!
    
    func update()
    {
        
        a = a + 1
        if (a % 2 == 1)
        {
            dog1.hidden = true
            dog2.hidden = false
        }
        else
        {
            dog1.hidden = false
            dog2.hidden = true
        }
    }
}