//
//  ViewController.swift
//  Twitter
//
//  Created by Mattia on 15/12/2015.
//  Copyright © 2015 Mattia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var ref = Firebase(url: "https://twittermattia.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if ref.authData != nil {
            
            print("User already sign in")
            self.performSegueWithIdentifier("loginAndSignUp", sender: self)
        } else {
    print("You have to sign Up")
     
        }
    }

    @IBAction func login(sender: AnyObject) {
    
        if emailTextField.text == "" || passwordTextField.text == "" {
            print("fill the fields")
        } else {
            
            ref.authUser(emailTextField.text, password: passwordTextField.text, withCompletionBlock: { (error, authData) -> Void in
                
                if error != nil {
                    print(error)
                    print ("there is an error with your information")
                } else {
                    print("successfully login")
                    self.performSegueWithIdentifier("loginAndSignUp", sender: self)

                }
            })
        }
    }

   
    @IBAction func signUp(sender: AnyObject) {
    
        if emailTextField.text == "" || passwordTextField.text == "" {
            print("Insert something")
            
        } else {
            ref.createUser(emailTextField.text, password: passwordTextField.text, withValueCompletionBlock: { (error, result) -> Void in
                
                if error != nil {
                    
                    let myError = error
                    print(myError)
                    
                } else {
                    
                    print("success")
                    
                    self.ref.authUser(self.emailTextField.text, password: self.passwordTextField.text, withCompletionBlock: { (error, authData) -> Void in
                        
                        if error != nil {
                            
                            print(error)
                            print("there is an error with your given information")
                            
                        } else {
                            
                            
                            let newUser =  [
                                "provider": authData.provider,
                                "email": authData.providerData["email"] as? NSString as? String,
                            
                            ]
                            
                            self.ref.childByAppendingPath("users").childByAppendingPath(authData.uid).setValue(newUser)
                            
                            self.performSegueWithIdentifier("loginAndSignUp", sender: self)
                        }
                    
                    })
                    
                }
            })
        }
        
      }
    
   }

