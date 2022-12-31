//
//  SignUpViewController.swift
//  To Do List
//
//  Created by Labib Khan on 12/24/22.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var alertLabel: UILabel!
    @objc func delayFunction(){
        emailText.text = ""
        passwordText.text = ""
    }
    @objc func deleteFunction(){
        alertLabel.text = ""
    }
    @IBAction func signupClicked(_ sender: UIButton) {
        guard let email = emailText.text else { return }
        guard let password = passwordText.text else { return }
        
        let delay = 0.1
        self.perform(#selector(self.delayFunction), with: nil, afterDelay: delay)
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                self.alertLabel.text = "You already have an account"
                let delay = 1.0
                self.perform(#selector(self.deleteFunction), with: nil, afterDelay: delay)
            }
            else{
                self.alertLabel.text = "Sign up successful. Please log in"
                let delay = 1.0
                self.perform(#selector(self.deleteFunction), with: nil, afterDelay: delay)
    
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
