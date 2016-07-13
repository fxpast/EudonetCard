//
//  ViewController.swift
//  EudonetCard
//
//  Created by MacbookPRV on 13/07/2016.
//  Copyright © 2016 Pastouret Roger. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var IBPhoto: UIImageView!
    @IBOutlet weak var IBCodeBarre: UIImageView!
    @IBOutlet weak var IBLinkedIn: UIImageView!
    @IBOutlet weak var IBFacebook: UIImageView!
    @IBOutlet weak var IBTwitter: UIImageView!
    @IBOutlet weak var IBLabel1: UILabel!
    @IBOutlet weak var IBLabel2: UILabel!
    @IBOutlet weak var IBLabel3: UILabel!
    @IBOutlet weak var IBLabel4: UILabel!
    @IBOutlet weak var IBLabel5: UILabel!
    
    
    let contact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.IBLinkedIn.image = UIImage(named: "linkedin")
        self.IBFacebook.image = UIImage(named: "facebook")
        self.IBTwitter.image = UIImage(named: "twitter")
        
        getContact { (success, contact, errorString) in
            
            if success {
                performUIUpdatesOnMain {
                    
                    
                    self.IBPhoto.layer.borderWidth = 1
                    self.IBPhoto.layer.masksToBounds = false
                    self.IBPhoto.layer.borderColor = UIColor.blackColor().CGColor
                    self.IBPhoto.layer.cornerRadius = self.IBPhoto.frame.height/4
                    self.IBPhoto.clipsToBounds = true
                    self.IBPhoto.image = contact?.photo
                    
                    self.IBCodeBarre.image = contact?.codebarre2d
                    self.IBLabel2.text = "\(contact!.prenom) \(contact!.nom)"
                    self.IBLabel3.text = contact?.rue
                    self.IBLabel4.text = contact?.etage
                    
                    
                }
                
            }
            else {
                performUIUpdatesOnMain {
                    
                    self.displayAlert("Error", mess: errorString!)
                    
                }
            }
        }
        
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        coordinator.animateAlongsideTransition({ (context) in
            
            let orient = UIApplication.sharedApplication().statusBarOrientation
            if orient.isPortrait {
                print("rotation portrait carte")
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            
        }) { (context) in
            print("rotation complete carte")
        }
        
        
    }
    
    
    
}

