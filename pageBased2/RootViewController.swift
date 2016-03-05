//
//  RootViewController.swift
//  pageBased2
//
//  Created by DaichiSaito on 2016/02/11.
//  Copyright © 2016年 DaichiSaito. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate {

    var pageViewController: UIPageViewController?


    override func viewDidLoad() {
        super.viewDidLoad()
        let pageController:UIPageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        
//        self.pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        
        let navigationController:testDaichi = testDaichi(rootViewController: pageController)
//                let navigationController:testDaichi = testDaichi(rootViewController: self)
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
//        let targetViewController2 = self.storyboard!.instantiateViewControllerWithIdentifier( "target" )
        let profileCollectionController1 = self.storyboard!.instantiateViewControllerWithIdentifier( "ProfileCollectionView1" )
        let profileCollectionController2 = self.storyboard!.instantiateViewControllerWithIdentifier( "ProfileCollectionView1" )
//        self.addChildViewController(targetViewController)
//        self.view.addSubview(targetViewController.view)
//        navigationController.viewControllerArray = [targetViewController,targetViewController2,demo3]
        navigationController.viewControllerArray = [profileCollectionController1,profileCollectionController2,targetViewController]
        
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
//        self.pageViewController = UIPageViewController(transitionStyle: .PageCurl, navigationOrientation: .Horizontal, options: nil)
//        self.pageViewController!.delegate = self
//
//        let startingViewController: DataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
//        let viewControllers = [startingViewController]
//        self.pageViewController!.setViewControllers([navigationController], direction: .Forward, animated: false, completion: {done in })
//
//        self.pageViewController!.dataSource = navigationController
//
        self.addChildViewController(navigationController)
        self.view.addSubview(navigationController.view)
//
//        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
        }
        navigationController.pageController.view.frame = pageViewRect

        navigationController.pageController.didMoveToParentViewController(self)

        // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
//        self.view.gestureRecognizers = navigationController.pageController.gestureRecognizers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    var modelController: ModelController {
//        // Return the model controller object, creating it if necessary.
//        // In more complex implementations, the model controller may be passed to the view controller.
//        if _modelController == nil {
//            _modelController = ModelController()
//        }
//        return _modelController!
//    }
//
//    var _modelController: ModelController? = nil
//
//    // MARK: - UIPageViewController delegate methods
//
//    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
//        if (orientation == .Portrait) || (orientation == .PortraitUpsideDown) || (UIDevice.currentDevice().userInterfaceIdiom == .Phone) {
//            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
//            let currentViewController = self.pageViewController!.viewControllers![0]
//            let viewControllers = [currentViewController]
//            self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: {done in })
//
//            self.pageViewController!.doubleSided = false
//            return .Min
//        }
//
//        // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
//        let currentViewController = self.pageViewController!.viewControllers![0] as! DataViewController
//        var viewControllers: [UIViewController]
//
//        let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController)
//        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
//            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfterViewController: currentViewController)
//            viewControllers = [currentViewController, nextViewController!]
//        } else {
//            let previousViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerBeforeViewController: currentViewController)
//            viewControllers = [previousViewController!, currentViewController]
//        }
//        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: true, completion: {done in })
//
//        return .Mid
//    }


}

