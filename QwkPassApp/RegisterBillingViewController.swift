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

class RegisterBillingViewController: UIViewController {

    var emailPassed = ""
    var passwordPassed = ""
    
    email.text = emailPassed
    password.text = passwordPassed
    //Work on this https://code.tutsplus.com/tutorials/ios-sdk-passing-data-between-controllers-in-swift--cms-27151
    
    
    //Text Fields
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBOutlet weak var Email_Registration: UITextField!
    @IBOutlet weak var Password_Registration: UITextField!
    
    @IBAction func RegisterButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text = emailPassed!, password: password.text = passwordPassed!) { (users, error) in
            // ...
        }
        performSegue(withIdentifier: "Registration_to_Sign_In", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
