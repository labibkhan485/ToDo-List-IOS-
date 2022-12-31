//
//  ViewController.swift
//  To Do List
//
//  Created by Labib Khan on 12/24/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInLabel: UILabel!
    @objc func delayFunction(){
        signInLabel.text = ""
    }
    @objc func deleteFunction(){
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                self.signInLabel.text = "Please Enter Email/ Password correctly!"
                
                let delay = 2.0
                self.perform(#selector(self.delayFunction), with: nil, afterDelay: delay)            }
            else{
                let delay = 0.1
                self.perform(#selector(self.deleteFunction), with: nil, afterDelay: delay)
                var str1 = self.emailTextField.text!
                str1 = str1.replacingOccurrences(of: ".", with: "@", options: NSString.CompareOptions.literal, range: nil)
                Constants.Storyboard.key = str1
                
                self.performSegue(withIdentifier: "Homepage", sender: self)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

