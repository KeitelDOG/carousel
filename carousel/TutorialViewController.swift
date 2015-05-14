//
//  TutorialViewController.swift
//  carousel
//
//  Created by Jules Walter on 5/12/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var welcome1ImageView: UIImageView!
    
    @IBOutlet weak var welcome2ImageView: UIImageView!
    
    @IBOutlet weak var welcome3ImageView: UIImageView!
    
    @IBOutlet weak var welcome4ImageView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var takeforSpinView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tutorialScrollView.contentSize.width = welcome1ImageView.image!.size.width + welcome2ImageView.image!.size.width +
        welcome3ImageView.image!.size.width + welcome4ImageView.image!.size.width
        tutorialScrollView.contentSize.height = welcome1ImageView.image!.size.height
        
        tutorialScrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {// called when scroll view grinds to a halt
        var page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.alpha = 0
            takeforSpinView.alpha = 1
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
