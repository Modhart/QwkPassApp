//
//  ManageUserInfoViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 10/29/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit

class ManageUserInfoViewController: UIViewController {

    @IBOutlet weak var EditEmail: UITextField!
    @IBOutlet weak var ConfirmPassEdit: UITextField!
    @IBOutlet weak var EditPassword: UITextField!
    @IBOutlet weak var EditUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveEdits(_ sender: Any) {
        
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
