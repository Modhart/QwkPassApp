//
//  RegisterBillingViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/30/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class RBVC: UIViewController {

    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Pass: UILabel!
    @IBOutlet weak var CPass: UILabel!
    
    var ref: DatabaseReference!
    var emailPassed = String()
    var passwordPassed = String()
    var confpassPassed = String()
    var usernamePassed = String()
    
    
    //email.text = emailPassed
    //password.text = passwordPassed
    //Work on this https://code.tutsplus.com/tutorials/ios-sdk-passing-data-between-controllers-in-swift--cms-27151
    
    
    //Text Fields
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Email.text = emailPassed
        Pass.text = passwordPassed
        CPass.text = confpassPassed
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        //Firebase - Listen for authentication state
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ....
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Registration_to_Sign_In" {
            if authverified == false {
                return false
            }
            else{
                print("Register Segue will occur")
                performSegue(withIdentifier: "Registration_to_Sign_In", sender: self)
            }
        }
        
        return true
    }
    
    
    var authverified = false
    
    @IBAction func RegisterButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailPassed, password: passwordPassed) { (user, error) in
            if let error = error {
                self.showToast(message: error.localizedDescription)
                print(error.localizedDescription)
                return
            }
            self.authverified = true
            self.shouldPerformSegue(withIdentifier: "Registration_to_Sign_In", sender: self)
            print("\(user!.email!) created")
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //code needs to change below
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/80, y: self.view.frame.size.height-100, width: self.view.frame.size.width - 10, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Nunito", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}
