
import UIKit
import Firebase


class signUpVC: UIViewController {
    
    @IBOutlet weak var emailEnter: UITextField!
    @IBOutlet weak var userNameEnter: UITextField!
    @IBOutlet weak var passwordEnter: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    
    @IBAction func summitToWaitPage(_ sender: UIButton) {
        let email = emailEnter.text
        let username = userNameEnter.text
        let password = passwordEnter.text
        let reEnter = rePassword.text
        if email == "" || username == "" || password == "" || reEnter == "" {
            //Fill all space
            let alertController = UIAlertController(title: "Fill all space", message: "", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController,animated: true,completion: nil)
        }
        else{
            if password != reEnter{
                //passwords are not the same
                let alertController = UIAlertController(title: "passwords are not the same", message: "", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                self.present(alertController,animated: true,completion: nil)
            }
            else{
                if let email = emailEnter.text,let password = passwordEnter.text{
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if let firebaseError = error{
                            print(firebaseError.localizedDescription)
                            let alertController = UIAlertController(title: firebaseError.localizedDescription, message: "", preferredStyle: UIAlertController.Style.alert)
                            alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alertController,animated: true,completion: nil)
                            return
                        }
                    }
                }
            }
        }
    }
}
