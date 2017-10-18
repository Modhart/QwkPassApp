//
//  LaunchViewController.swift
//  QwkPassApp
//
//  Created by Jay Bajaj on 9/15/17.
//  Copyright © 2017 Jay Bajaj. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import Firebase

class LaunchViewController: UIViewController {
    
    var dict : [String : AnyObject]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        
        let screenSize:CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height //real screen height
        //let's suppose we want to have 10 points bottom margin
        let newCenterY = screenHeight - loginButton.frame.height - 50
        let newCenter = CGPoint(x:view.center.x, y:newCenterY)
        loginButton.center = newCenter
        //adding it to view
        view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                self.getFBUserData()
            }
        }
    }
    
    var handle: AuthStateDidChangeListenerHandle?
    

    
    override func viewWillAppear(_ animated: Bool) {
        //Firebase - Listen for authentication state
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ....
        }
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "SignInSegue" {
            if authverified == false {
                return false
            }
            else{
                
                print("Sign in Segue will occur")
                performSegue(withIdentifier: "SignInSegue", sender: self)
            }
        }
        return true
    }
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var authverified = false

    
    @IBAction func SignIn(_ sender: UIButton) {
        if let email = Email.text, let password = Password.text {
            Auth.auth().signIn(withEmail: email, password: password) { (users, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.authverified = true
                self.shouldPerformSegue(withIdentifier: "SignInSegue", sender: self)
            }
        }
        else {
            print("Error loggin in no Email/Password specified")
        }
       
        
    }
    
    @IBAction func SignUp(_ sender: UIButton) {
    
    }
    
    
}


