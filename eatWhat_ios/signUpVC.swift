
import UIKit
import Firebase


class signUpVC: UIViewController {
    var docRef : DocumentReference!
    
    @IBOutlet weak var emailEnter: UITextField!
    @IBOutlet weak var userNameEnter: UITextField!
    @IBOutlet weak var passwordEnter: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    @IBOutlet weak var userBirthday: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        userBirthday.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        userBirthday.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    func showMessage( enter : String){
        let alertController = UIAlertController(title: enter, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "我瞭解了", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func summitToWaitPage(_ sender: UIButton) {
        let email = emailEnter.text
        let username = userNameEnter.text
        let password = passwordEnter.text
        let reEnter = rePassword.text
        let userBirthday = self.userBirthday.text
        
        if email == "" || username == "" || password == "" || reEnter == "" {
            //Fill all space
            self.showMessage(enter: "請填滿所有格子")
        }
        else{
            if password != reEnter{
                //passwords are not the same
                self.showMessage(enter: "密碼不一樣")
            }
            else{
                if let email = emailEnter.text,let password = passwordEnter.text{
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if let firebaseError = error{
                            print(firebaseError.localizedDescription)
                            self.showMessage(enter: firebaseError.localizedDescription)
                            return
                        }
                        else{
                            if Auth.auth().currentUser != nil {//if使用者 == true
                                let user = Auth.auth().currentUser//user抓現在使用者
                                if let user = user {
                                    let uid = user.uid
                                    let emailGet = user.email
                                    self.docRef = Firestore.firestore().collection("user").document(email)//document.name = email
                                    let dataToSave : [String:Any] = ["user's email":emailGet as Any, "user's uid":uid, "username":username as Any, "user's password" : password as Any, "user's birthday" : userBirthday as Any]
                                    self.docRef.setData(dataToSave)
                                }
                            }
                            //轉到sentVerificationVC
                            let gg:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let sentVerificationVC :sentVerificationVC  = gg.instantiateViewController(withIdentifier: "sentVerificationVC") as! sentVerificationVC
                            self.present(sentVerificationVC ,animated: true,completion: nil)
                        }
                    }
                }
            }
        }
    }
}
