//
//  ViewController.swift
//  eatWhat_ios
//
//  Created by 徐浩哲 on 2018/10/6.
//  Copyright © 2018 徐浩哲. All rights reserved.
//

import UIKit
import Firebase

class MainPage: UIViewController {

    @IBOutlet weak var emailEnter: UITextField!
    @IBOutlet weak var passwordEnter: UITextField!
    
    let actionCodeettings = ActionCodeSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func singIn(_ sender: UIButton) {
        if let email = emailEnter.text, let password = passwordEnter.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let firebaseError = error{
                    if firebaseError.localizedDescription == "The email address is badly formatted."{
                        let alertController = UIAlertController(title: "The email address is badly formatted.", message: "", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController,animated: true,completion: nil)
                    }
                    if firebaseError.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted."{
                        let alertController = UIAlertController(title: "Please sign up", message: "", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController,animated: true,completion: nil)
                    }
                    if firebaseError.localizedDescription == "The password is invalid or the user does not have a password."{
                        let alertController = UIAlertController(title: "The password is invalid", message: "", preferredStyle: UIAlertController.Style.alert)
                        alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alertController,animated: true,completion: nil)
                    }
                    
                }
                else{
                    let gg:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let loggedInPage : loggedInVC = gg.instantiateViewController(withIdentifier: "loggedInVC") as! loggedInVC
                    self.present(loggedInPage,animated: true,completion: nil)
                }
        }
    }
}
    
    @IBAction func singUp(_ sender: UIButton) {
        let gg:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpPage :signUpVC  = gg.instantiateViewController(withIdentifier: "signUpVC") as! signUpVC
        self.present(signUpPage ,animated: true,completion: nil)
    }
    
    
    
    
    
//    func present(UIViewController, animated: Bool, completion: (() -> Void)? = nil)
//    Presents a view controller modally.
}



//@IBAction func singIn(_ sender: UIButton) {
//    if let email = emailEnter.text, let password = passwordEnter.text {
//        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//            if error == nil {
//                self.presentLoggedInPage()
//            }
//            else{
//                let alertController = UIAlertController(title: "Wrong Password", message: "", preferredStyle: UIAlertController.Style.alert)
//                alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alertController,animated: true,completion: nil)
//            }
//            if user == nil{
//                let alertController = UIAlertController(title: "Go sign up", message: "", preferredStyle: UIAlertController.Style.alert)
//                alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alertController,animated: true,completion: nil)
//            }
//        }
//    }
//}
