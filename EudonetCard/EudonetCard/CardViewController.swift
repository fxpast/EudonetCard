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
    @IBOutlet weak var IBViadeo: UIImageView!
    @IBOutlet weak var IBTwitter: UIImageView!
    @IBOutlet weak var IBRuban: UILabel!
    @IBOutlet weak var IBLigne1: UILabel!
    @IBOutlet weak var IBLigne2: UILabel!
    @IBOutlet weak var IBLigne3: UILabel!
    @IBOutlet weak var IBLigne4: UILabel!
    @IBOutlet weak var IBLigne5: UILabel!
    @IBOutlet weak var IBLigne6: UILabel!
    @IBOutlet weak var IBLigne7: UILabel!
    @IBOutlet weak var IBLigne8: UILabel!
    
    let contact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.IBLinkedIn.image = UIImage(named: "linkedin")
        self.IBViadeo.image = UIImage(named: "viadeo")
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
                    
                    self.IBLigne1.text = "\(contact!.prenom) \(contact!.nom)"
                    
                    self.IBLigne2.text = "Directeur technique" // valeur temporaire
                    self.IBLigne3.text = "rmaginot@eudoweb.com" // valeur temporaire
                    
                    self.IBLigne4.text = "Eudonet" // valeur temporaire
                    self.IBLigne5.text = "\(contact!.rue) - \(contact!.etage)"
                    self.IBLigne6.text = "CS 50001 - 92407 Courbevoie Cedex" // valeur temporaire
                    
                    self.IBLigne7.text = "Tél : +33 (0)1 47 37 53 77" // valeur temporaire
                    
                    self.IBLigne8.text = "www.eudoweb.com" // valeur temporaire
                    
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

