//
//  ViewController.swift
//  EudonetCard
//
//  Created by MacbookPRV on 13/07/2016.
//  Copyright © 2016 Pastouret Roger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let orient = UIApplication.sharedApplication().statusBarOrientation
        
        if  orient.isLandscape {
            
            print("rotation paysage")
            self.performSegueWithIdentifier("carte", sender: self)
        }
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        coordinator.animateAlongsideTransition({ (context) in
            
            let orient = UIApplication.sharedApplication().statusBarOrientation
            
            if  orient.isLandscape {
                
                print("rotation paysage")
                self.performSegueWithIdentifier("carte", sender: self)
            }
            
        }) { (context) in
            print("rotation complete")
        }
        
        
    }
    
    
    
}

