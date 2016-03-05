//
//  ViewController.swift
//  ZDT_InstaTutorial
//
//  Created by Sztanyi Szabolcs on 22/12/15.
//  Copyright © 2015 Zappdesigntemplates. All rights reserved.
//

import UIKit

class ControllerViewItem2_1: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ControllerViewItem2_1")
        
        let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "target" ) 
        self.addChildViewController(targetViewController)
        self.view.addSubview(targetViewController.view)
//        self.presentViewController( targetViewController, animated: true, completion: nil)
        
        var pageViewRect = self.view.bounds
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
        }
        targetViewController.view.frame = pageViewRect
        
        targetViewController.didMoveToParentViewController(self)
        
    }
}
