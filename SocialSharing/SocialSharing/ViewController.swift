//
//  ViewController.swift
//  SocialSharing
//
//  Created by akash savediya on 05/04/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBAction func buttonAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "share", message: "share poem of the day", preferredStyle: .actionSheet)
        
        //First Alert
        
        let actionOne = UIAlertAction(title: "share on facebook", style: .default) {(action) in
         print("success")
       
        
        //checking user is connected to fb 
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
        {
            let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            post?.setInitialText("poem of the day")
            post?.add(UIImage(named: "img.jpg"))
            self.present(post!, animated: true, completion: nil)
            
        } else {
            self.showAlert(service: "Facebook")
        }
    }
        
        //second Alert
        
        let actionTwo = UIAlertAction(title: "share on twitter", style: .default) {(action) in
            print("success")
            
            
            //checking user is connected to fb
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                post?.setInitialText("poem of the day")
                post?.add(UIImage(named: "img.jpg"))
                self.present(post!, animated: true, completion: nil)
                
            } else {
                self.showAlert(service: "Twitter")
            }
        }
        let actionThree = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        // add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        //present alert
        
            self.present(alert, animated: true, completion: nil)
        
    }
    
    func showAlert(service:String){
        let alert = UIAlertController(title: "Error", message: "you are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

