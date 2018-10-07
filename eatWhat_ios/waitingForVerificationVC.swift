//
//  waitingForVerificationVC.swift
//  eatWhat_ios
//
//  Created by 徐浩哲 on 2018/10/6.
//  Copyright © 2018 徐浩哲. All rights reserved.
//

import UIKit
import Firebase

class waitingForVerificationVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func sentEmail(_ sender: UIButton) {
        if Auth.auth().currentUser != nil {//if使用者 == true
            let user = Auth.auth().currentUser//user抓現在使用者
            if let user = user {
                let uid = user.uid
                let emailGet = user.email
                
                print(uid)
                print(emailGet as Any)
                
                let actionCodeSettings = ActionCodeSettings()
                actionCodeSettings.url = URL(string: "https://www.eatwhat-3582b.firebaseapp.com")
                actionCodeSettings.handleCodeInApp = true
                actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
                Auth.auth().currentUser?.sendEmailVerification { (error) in//寄出驗證信
                    if Auth.auth().currentUser?.isEmailVerified  != nil{
                        print ("reeeeeeeee")
                        //go to setting
                    }
                }
            }
        }
    }
    
}
