//
//  PictureViewController.swift
//  carousel
//
//  Created by Jules Walter on 5/17/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var photo1ImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize.width = photo1ImageView.image!.size.width * 2
        scrollView.contentSize.height = photo1ImageView.image!.size.height
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "photo_full_screen")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {// called when scroll view grinds to a halt
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "swipe_photo")
        defaults.synchronize()
    }
    
    @IBAction func goBack(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func sharePicture(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "share_photo")
        defaults.synchronize()
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
