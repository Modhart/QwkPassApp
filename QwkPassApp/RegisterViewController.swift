//
//  RegisterViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/15/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

//    //Button
//    @IBAction func nextbutton(_ sender: Any) {
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Email_Registration: UITextField!
    @IBOutlet weak var Username_Registration: UITextField!
    @IBOutlet weak var Password_Registration: UITextField!
    @IBOutlet weak var Confpass_Registration: UITextField!
    
    var authverified = false
    
    @IBAction func NextButton(_ sender: Any) {
        if Email_Registration.text != "" && Password_Registration.text != "" && Confpass_Registration.text != ""{
            authverified = true
            shouldPerformSegue(withIdentifier: "Reg_to_Reg_with_Billing", sender: self)
        }
        else {
            authverified = false
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Reg_to_Reg_with_Billing" {
            if authverified == false {
                return false
            }
            else{
                print("Next Segue will occur")
                performSegue(withIdentifier: "Reg_to_Reg_with_Billing", sender: self)
            }
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            var secondcontroller = segue.destination as! RBVC
        
            secondcontroller.emailPassed = Email_Registration.text!
            secondcontroller.passwordPassed = Password_Registration.text!
            secondcontroller.confpassPassed = Confpass_Registration.text!
//            secondcontroller.unPassed = Username_Registration.text!
    }

}
