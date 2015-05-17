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
        
        var defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "viewPhotoFullScreen")
        defaults.synchronize()
    }
    
    @IBAction func didDismissBanner(sender: AnyObject) {
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
