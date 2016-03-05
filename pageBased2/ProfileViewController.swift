//
//  ViewController.swift
//  ZDT_InstaTutorial
//
//  Created by Sztanyi Szabolcs on 22/12/15.
//  Copyright © 2015 Zappdesigntemplates. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController{
    
    
    @IBOutlet weak var underView: UIView!
    @IBOutlet weak var profile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ProfileViewController")
        
        profile.image = UIImage(named: "profile.jpg")
        
        
        let pageController:UIPageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        let navigationController:ProfileNavigation = ProfileNavigation(rootViewController: pageController)
        let demo:UIViewController = UIViewController()
        let demo2:UIViewController = UIViewController()
        let demo3:UIViewController = UIViewController()
        let demo4:UIViewController = UIViewController()
        let demo5:UIViewController = UIViewController()
        demo.view.backgroundColor = UIColor.redColor()
        demo2.view.backgroundColor = UIColor.whiteColor()
        demo3.view.backgroundColor = UIColor.grayColor()
        demo4.view.backgroundColor = UIColor.orangeColor()
        demo5.view.backgroundColor = UIColor.brownColor()
        
        let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "target" )
        let profileCollectionController1 = self.storyboard!.instantiateViewControllerWithIdentifier( "ProfileCollectionView1" )
        profileCollectionController1.view.backgroundColor = UIColor.redColor()
//        navigationController.viewControllerArray = [targetViewController,demo2]
        navigationController.viewControllerArray = [profileCollectionController1,demo2]
        
        self.addChildViewController(navigationController)
        underView.addSubview(navigationController.view)

        
        var pageViewRect = self.view.bounds
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
        }
        navigationController.pageController.view.frame = pageViewRect

//        let json = "http://dl.dropboxusercontent.com/u/7817937/nameko.json"
//        let uri = NSURL(string: json)
//        let uridata = NSData(contentsOfURL: uri!)
//        let objects = uridata!.objectFromJSONData() as! NSDictionary
//        let array = objects.objectForKey("images") as! [String]
//        data += array
        
        
        
        
//        let targetViewController = self.storyboard!.instantiateViewControllerWithIdentifier( "settingNavigation" )
//        self.addChildViewController(targetViewController)
//        self.view.addSubview(targetViewController.view)
//        //        self.presentViewController( targetViewController, animated: true, completion: nil)
//        
//        var pageViewRect = self.view.bounds
//        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
//            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
//        }
//        targetViewController.view.frame = pageViewRect
//        
//        targetViewController.didMoveToParentViewController(self)
//        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//    
//    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
//        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCollectionViewCell
//        let url = NSURL(string: data[indexPath.row])
//        let placeholder = UIImage(named: "transparent.png")
//        cell.image!.setImageWithURL(url, placeholderImage: placeholder)
//        return cell
//    }
//    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }
}
