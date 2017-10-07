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
    
    @IBAction func NextButton(_ sender: Any) {
        let myVC = storyboard?.instantiateViewControllerWithIdentifier("RegistrationBillingViewController") as! SecondVC
        myVC.emailPassed = Email_Registration.text!
        myVC.passwordPassed = Password_Registration.text!
        RegistrationBillingViewController?.pushViewController(myVC, animated: true)
        
        performSegue(withIdentifier: Reg_to_Reg_with_Billing, sender: self)
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
