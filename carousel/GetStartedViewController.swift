//
//  GetStartedViewController.swift
//  carousel
//
//  Created by Jules Walter on 5/16/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didDismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
