//
//  GameViewController.swift
//  RockPaperScissors
//
//  Created by Wei Wu on 9/4/14.
//  Copyright (c) 2014 Wei. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class GameViewController: AdDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.canDisplayBannerAds = true
    }
    
    @IBAction func Play(sender: AnyObject) {
        self.performSegueWithIdentifier("Test", sender: self)
    }

    @IBAction func HowToPlay(sender: AnyObject) {
        self.performSegueWithIdentifier("HowToPlay", sender: self)
    }
    
    @IBAction func Rate(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "itms-apps://itunes.apple.com/app/id925621362")!)
        
    }
    @IBAction func MoreGames(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "https://itunes.apple.com/us/artist/wei-wu/id906951741")!)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    @IBOutlet weak var banner: ADBannerView!
}
