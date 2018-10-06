//
//  loggInVC.swift
//  eatWhat_ios
//
//  Created by 徐浩哲 on 2018/10/6.
//  Copyright © 2018 徐浩哲. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class loggedInVC: UIViewController {

    
    @IBAction func loggOut(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }
        catch{
            print("Firebase sign out error")
        } 
    }
}
