//
//  SignInViewController.swift
//  carousel
//
//  Created by Jules Walter on 5/12/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var loginText: UIImageView!
    
    @IBOutlet weak var navBarView: UIImageView!
    
    var topViewCenter: CGPoint!
    var bottomViewCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        topViewCenter = topView.center
        bottomViewCenter = bottomView.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.topView.center.y = self.topViewCenter.y
            self.bottomView.center.y = self.bottomViewCenter.y
            self.loginText.alpha = 1
            
            }, completion: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
           self.topView.center.y -= self.loginText.image!.size.height
            self.bottomView.center.y -= kbSize.height
            self.loginText.alpha = 0
            
            }, completion: nil)
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    @IBAction func didPressSignInButton(sender: AnyObject) {
        
        if emailField.text.isEmpty || passwordField.text.isEmpty {
            
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            
            alertView.show()
            
        } else {
            
            var loadingAlertView = UIAlertView(title: nil, message: "Signin in...", delegate: self, cancelButtonTitle: nil)
            loadingAlertView.show()
            
            delay(2){
                loadingAlertView.dismissWithClickedButtonIndex(0, animated: true)
                
                if self.emailField.text == "tim@thecodepath.com" && self.passwordField.text == "password"{
                    self.performSegueWithIdentifier("signInSegue", sender: nil)
                } else {
                    var alertView = UIAlertView(title: "Sign in Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
