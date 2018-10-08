//
//  loggInVC.swift
//  eatWhat_ios
//
//  Created by 徐浩哲 on 2018/10/6.
//  Copyright © 2018 徐浩哲. All rights reserved.
//

import UIKit
import Firebase

class loggedInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func showMessage( enter : String){
        let alertController = UIAlertController(title: enter, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
    
    @IBAction func goToSettingPage(_ sender: UIButton) {
        let gg:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingPage :settingPage  = gg.instantiateViewController(withIdentifier: "settingPage") as! settingPage
        self.present(settingPage ,animated: true,completion: nil)
    }
    
    
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
