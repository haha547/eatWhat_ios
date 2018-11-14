
import UIKit
import Firebase

class loggedInVC: UIViewController {
    var docRef : DocumentReference!
    
    @IBOutlet weak var user_enter_height: UITextField!
    @IBOutlet weak var user_enter_weight: UITextField!
    
    private var height_picker:UIPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func showMessage( enter : String){
        let alertController = UIAlertController(title: enter, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "我瞭解了", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
    
    
    @IBAction func set_Done(_ sender: UIButton) {
        let height = user_enter_height.text
        let weight = user_enter_weight.text
        if Auth.auth().currentUser != nil{
            let user = Auth.auth().currentUser//user抓現在使用者
            if let user = user {
                let emailGet = user.email
                self.docRef = Firestore.firestore().collection("user").document(emailGet as! String)//document.name = email
                let dataToSave : [String:Any] = ["user's height":height as Any,"user's weight" : weight as Any]
                self.docRef.updateData(dataToSave)
                let gg:UIStoryboard = UIStoryboard(name: "function", bundle: nil)
                let mainMenuVC :mainMenuVC  = gg.instantiateViewController(withIdentifier: "mainMenuVC") as! mainMenuVC
                self.present(mainMenuVC ,animated: true,completion: nil)
            }
        }
        else{
            print ("error")
        }
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
