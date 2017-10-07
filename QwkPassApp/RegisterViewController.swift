//
//  RegisterViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/15/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var Password_Registration: UITextField!
    @IBOutlet weak var Confpass_Registration: UITextField!
    
    
    @IBAction func NextButton(_ sender: Any) {
        if Email_Registration.text != "" {
            performSegue(withIdentifier:"Reg_to_Reg_with_Billing", sender: self)
        }
//
        
//        let myVC = storyboard?.instantiateViewController(withIdentifier: "RegistrationBillingViewController") as! RegisterBillingViewController
//        myVC.emailPassed = Email_Registration.text!
//        myVC.passwordPassed = Password_Registration.text!
////        RegisterBillingViewController?.pushViewController(myVC, animated: true)
////        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondcontroller = segue.destination as! RegisterBillingViewController
        
        secondcontroller.emailPassed = Email_Registration.text!
        secondcontroller.passwordPassed = Password_Registration.text!
        secondcontroller.confpassPassed = Confpass_Registration.text!
        
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
