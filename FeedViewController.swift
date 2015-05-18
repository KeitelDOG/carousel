//
//  FeedViewController.swift
//  carousel
//
//  Created by Jules Walter on 5/14/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var bannerImageView: UIImageView!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var learnMoreButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.contentSize = feedImageView.image!.size
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var photo_full_screen = defaults.boolForKey("photo_full_screen")
        var swipe_photo = defaults.boolForKey("swipe_photo")
        var share_photo = defaults.boolForKey("share_photo")
        defaults.synchronize()
        
        if photo_full_screen && swipe_photo && share_photo {
            dismissBanner()
        }
    }
    
    @IBAction func didDismissBanner(sender: AnyObject) {
        dismissBanner()
    }
    
    func dismissBanner(){
        bannerImageView.alpha = 0
        dismissButton.alpha = 0
        learnMoreButton.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

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
