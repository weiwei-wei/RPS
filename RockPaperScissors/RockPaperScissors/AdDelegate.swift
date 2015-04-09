//
//  AdDelegate.swift
//  RPS
//
//  Created by Wei Wu on 9/29/14.
//  Copyright (c) 2014 Wei. All rights reserved.
//

import UIKit
import SpriteKit
import iAd
class AdDelegate: UIViewController, ADBannerViewDelegate
{
    func bannerView(banner: ADBannerView!,
        didFailToReceiveAdWithError error: NSError!)
    {
        banner.hidden = true
    }
    
}