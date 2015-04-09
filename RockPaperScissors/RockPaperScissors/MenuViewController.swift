//
//  UIViewController.swift
//  RockPaperScissors
//
//  Created by Wei Wu on 9/9/14.
//  Copyright (c) 2014 Wei. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class MenuViewController: AdDelegate {
    
    
    @IBOutlet weak var a1: UIImageView!
    @IBOutlet weak var a2: UIImageView!
    @IBOutlet weak var a3: UIImageView!
    @IBOutlet weak var b1: UIImageView!
    @IBOutlet weak var b2: UIImageView!
    @IBOutlet weak var b3: UIImageView!
    
    @IBOutlet weak var TimeText: UILabel!
    @IBOutlet weak var LevelText: UILabel!
    @IBOutlet weak var Hint: UILabel!
    
    override func viewDidLoad() {
        Level = 0
        LevelText.text = "Score: 0"
        LastImageIndex = 0
       UpdateImage()
        
        var timer : NSTimer
        timer = NSTimer(timeInterval: 1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: "NSDefaultRunLoopMode")
        a = 30;
        super.viewDidLoad()
    }
    
    var a : Int!
    func update()
    {
        
        a = a - 1
        if a < 0
        {
            GameOver()
        }
        
        
        TimeText.text = "Time: \(a)"
    }
    
    var IsBlack : Bool!
    var ImageIndex : Int!
    var LastImageIndex : Int! = 0
    var TargetIndex : Int!
    
    var Level : Int!
    
    var randomNumber: Int!
    
    func UpdateImage()
    {
        randomNumber = Int(arc4random() % 2)
        IsBlack = (randomNumber == 1)
        randomNumber = Int(arc4random() % 3)
        
        ImageIndex = (randomNumber + 1)
        
        if ImageIndex == LastImageIndex
        {
            ImageIndex = ImageIndex + 1
        }
        if ImageIndex > 3
        {
            ImageIndex = 1
        }
        LastImageIndex = ImageIndex

        
        HideAll()
        if IsBlack == true
        {
            if ImageIndex == 1
            {
                b1.hidden = false
            }
            else if ImageIndex == 2
            {
                b2.hidden = false
            }
            else if ImageIndex == 3
            {
                b3.hidden = false
            }
            Hint.text = "Hint: lose the red ones!"
        }
        else
        {
            if ImageIndex == 1
            {
                a1.hidden = false
            }
            else if ImageIndex == 2
            {
                a2.hidden = false
            }
            else if ImageIndex == 3
            {
                a3.hidden = false
            }
            Hint.text = "Hint: win the blue ones!"
        }

        CalculateTargetIndex()
    }
    
    func CalculateTargetIndex()
    {
        if IsBlack == true
        {
            TargetIndex = ImageIndex + 1
            if (TargetIndex > 3)
            {
                TargetIndex = 1
            }
        }
        else
        {
            TargetIndex = ImageIndex - 1
            if (TargetIndex < 1)
            {
                TargetIndex = 3
            }
        }
    }
    
    func HideAll()
    {
        a1.hidden = true
        a2.hidden = true
        a3.hidden = true
        b1.hidden = true
        b2.hidden = true
        b3.hidden = true
    }
    
    @IBAction func Tap1(sender: AnyObject) {
        if (TargetIndex == 1){
            Proceed()
        }
        else{
            GameOver()
        }
    }
    
    @IBAction func Tap2(sender: AnyObject) {
        if (TargetIndex == 2){
            Proceed()
        }
        else{
            GameOver()
        }
    }
    
    @IBAction func Tap3(sender: AnyObject) {
        if (TargetIndex == 3){
            Proceed()
        }
        else{
            GameOver()
        }
    }
    
    func Proceed()
    {
        Level = Level + 1
        UpdateImage()
        LevelText.text = "Score: \(Level)"
    }
    
    func GameOver()
    {
        performSegueWithIdentifier("End", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if let vc = segue.destinationViewController as? EndViewController {
            vc.Level = Level
        }
}
}
