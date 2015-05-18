//
//  GetStartedViewController.swift
//  carousel
//
//  Created by Jules Walter on 5/16/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var checkFullScreenButton: UIButton!
    
    @IBOutlet weak var swipePhotoButton: UIButton!
    
    @IBOutlet weak var sharePhotoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var photo_full_screen = defaults.boolForKey("photo_full_screen")
        var swipe_photo = defaults.boolForKey("swipe_photo")
        var share_photo = defaults.boolForKey("share_photo")
        defaults.synchronize()
        
        if photo_full_screen {
            checkFullScreenButton.selected = true
        }
        if swipe_photo {
            swipePhotoButton.selected = true
        }
        if share_photo {
            sharePhotoButton.selected = true
        }
        
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
