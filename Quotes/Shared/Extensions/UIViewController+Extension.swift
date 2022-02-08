//
//  UIViewController+Extension.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/01/22.
//

import UIKit
import Foundation

extension UIViewController {

    /**
     Function to remove view controller from parent
     */
    func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }

    /**
     Function to add as child view controller
     */
    func add(asChildViewController viewController: UIViewController, contextView: UIView) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        contextView.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = contextView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }

    /// This function adds basic top leading trailing botttom contraints to sub viewController's view
    /// - parameter subController: View controller that needs constraint
    func addDefaultConstraints(subController: UIViewController) {
        subController.view.translatesAutoresizingMaskIntoConstraints = false
        subController.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        subController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        subController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        subController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}

// MARK: - Top View controllers
extension UIViewController {
    func topMostViewController() -> UIViewController {
        
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        
        return self
    }
    
    /// Returns the top view controller by traversing through the navigation stack
    /// Currently this method is used for Kill Switch scenarios
    /// Note: Kindly verify if this works as expected if needs to be  resused
    func topViewController() -> UIViewController {
        
        // Checks if tabbar have presented view controller stack, then parse through it to fetch top
        if let tab = self as? UITabBarController, tab.presentedViewController != nil {
            return tab.selectedViewController?.topViewController() ?? tab
        } else if let tab = self as? UITabBarController {
            return tab
        }
        
        // Means VC has presented view controller,  As per observation its is Hosting view controller so fallback to Presenting view controller
        if let presentedViewController = self.presentedViewController, presentedViewController.isKind(of: UINavigationController.self) == false {
            return self.presentingViewController ?? presentedViewController
        }
        
        // Means the navigation top view controller has another set of navigation controllers
        if let navigation = self as? UINavigationController, navigation.viewControllers.last != navigation.presentedViewController {
            return navigation.viewControllers.last?.topViewController() ?? navigation
        } else if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topViewController() ?? navigation
        }
        
        // Checks if the presented view controller has a parent view controller
        if let presentedVC = self.presentedViewController, presentedVC.isKind(of: UINavigationController.self) {
            let navigationController = (presentedVC as? UINavigationController)?.viewControllers.last
            return navigationController?.presentedViewController ?? presentedVC
        }
        return self
    }
}
