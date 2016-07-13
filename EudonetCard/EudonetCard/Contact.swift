//
//  Data.swift
//  PressShare
//
//  Created by MacbookPRV on 11/05/2016.
//  Copyright © 2016 Pastouret Roger. All rights reserved.
//

import Foundation
import UIKit

struct Contact {
    
    //MARK: Properties
    
    var titre:String!
    var nom:String!
    var prenom:String!
    var entreprise:String!
    var batiment:String!
    var etage:String!
    var rue:String!
    var codepostal:String!
    var ville:String!
    var adresse:String!
    var teldomicile:String!
    var telbureau:String!
    var emailPro:String!
    var emailPriv:String!
    var mobile:String!
    var pays:String!
    var photo:UIImage!
    var codebarre2d:UIImage!
    var urlSiteweb:NSURL!
    var urlLinkedin:NSURL!
    var urlFacebook:NSURL!
    var urlTwitter:NSURL!
    var skype:String!
    var msn:String!
    var googleTalk:String!
    var facebookMess:String!
    var yahooMess:String!
    
    
    
}




func getContact(completionHandlerContact: (success: Bool, contact: Contact?, errorString:String?) -> Void)
{
    
    let pathJSON = NSBundle.mainBundle().pathForResource("data", ofType: "json")
    let dataJSON = NSFileManager.defaultManager().contentsAtPath(pathJSON!)
    
    /* Parse the data */
    let parsedResult: AnyObject!
    do {
        parsedResult = try NSJSONSerialization.JSONObjectWithData(dataJSON!, options: .AllowFragments)
    } catch {
        completionHandlerContact(success: false, contact: nil, errorString: "Could not parse the data as JSON")
        return
    }
    
    let ResultInfos = parsedResult["ResultInfos"] as! [String:AnyObject]
    if ResultInfos["Success"] as! Bool == true {
        let resultData = parsedResult["ResultData"] as! [String:AnyObject]
        let rows = resultData["Rows"] as! [[String:AnyObject]]
        let row = rows[0]
        let fields = row["Fields"] as! [[String:AnyObject]]
        
        var contact = Contact()
        
        for aField in fields  {
            
            if aField["DescId"] as! Int == 207 {
                contact.titre = aField["DbValue"] as! String
            }
            
            if aField["DescId"] as! Int == 201 {
                contact.nom = aField["DbValue"] as! String
            }
            
            if aField["DescId"] as! Int == 202 {
                contact.prenom = aField["DbValue"] as! String
            }
            if aField["DescId"] as! Int == 402 {
                contact.rue = aField["DbValue"] as! String
            }
            
            if aField["DescId"] as! Int == 407 {
                contact.etage = aField["DbValue"] as! String
            }
            
            
        }
        
        
        contact.photo = UIImage(named: "photo")
        contact.codebarre2d = UIImage(named: "codebarre")
        
        contact.adresse = ""
        contact.batiment = ""
        contact.codepostal = ""
        contact.emailPriv = ""
        contact.emailPro = ""
        contact.entreprise = ""
        contact.facebookMess = ""
        contact.googleTalk = ""
        contact.mobile = ""
        contact.msn = ""
        contact.pays = ""
        contact.skype = ""
        contact.telbureau = ""
        contact.teldomicile = ""
        contact.urlFacebook = nil
        contact.urlLinkedin = nil
        contact.urlSiteweb = nil
        contact.urlTwitter = nil
        contact.ville = ""
        contact.yahooMess = ""
        
        
        completionHandlerContact(success: true, contact: contact, errorString: nil)
    }
    else {
        completionHandlerContact(success: false, contact: nil, errorString:" erreur : \(ResultInfos["ErrorMessage"])")
        
    }
    
    
    
}






