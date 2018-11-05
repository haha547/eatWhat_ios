//
//  ViewController.swift
//  eatWhat_ios
//  登入（檢查是否有沒有驗證）或是選擇註冊
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
    
    func showMessage( enter : String){
        let alertController = UIAlertController(title: enter, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "我瞭解了", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
    
    @IBAction func singIn(_ sender: UIButton) {
        if let email = emailEnter.text, let password = passwordEnter.text {
             let userEnter = Auth.auth()
                userEnter.signIn(withEmail: email, password: password) { (user, error) in
                if let firebaseError = error{
                    if firebaseError.localizedDescription == "The email address is badly formatted."{
                        self.showMessage(enter: "不是正確電子信箱的格式")
                    }
                    if firebaseError.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted."{
                        self.showMessage(enter : "請註冊")
                    }
                    if firebaseError.localizedDescription == "The password is invalid or the user does not have a password."{
                        self.showMessage(enter: "密碼錯誤")
                    }
                    
                }
                else{
                    if userEnter.currentUser?.isEmailVerified == true{
                        let gg:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let loggedInPage : loggedInVC = gg.instantiateViewController(withIdentifier: "loggedInVC") as! loggedInVC
                        self.present(loggedInPage,animated: true,completion: nil)
                    }
                    self.showMessage(enter: "你的驗證信尚未驗證完成")
                    
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
