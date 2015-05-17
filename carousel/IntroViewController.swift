//
//  IntroViewController.swift
//  carousel
//
//  Created by Jules Walter on 5/11/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var tile1View: UIImageView!
    
    @IBOutlet weak var tile3View: UIImageView!
    
    @IBOutlet weak var tile4View: UIImageView!
    
    @IBOutlet weak var tile5View: UIImageView!
    
    @IBOutlet weak var tile6View: UIImageView!
    
    @IBOutlet weak var tile2View: UIImageView!
    
    @IBOutlet weak var introScrollView: UIScrollView!
    
    @IBOutlet weak var introImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        introScrollView.delegate = self
        introScrollView.contentSize = introImageView.image!.size
        
        animateTiles()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        animateTiles()
    }
    
    func animateTiles(){
        
        let yOffsets : [Float] = [-280, -250, -420, -400, -510, -490]
        let xOffsets : [Float] = [-75, 35, 8, 85, -115, -100]
        let scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
        let rotations : [Float] = [-10, -10, 10, 10, 10, -10]
        let tiles = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
        
        var offset = Float(introScrollView.contentOffset.y)
        
        for i in 0..<yOffsets.count{
            
            var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[i], r2Max: 0)
            var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[i], r2Max: 0)
            var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[i], r2Max: 1)
            var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[i], r2Max: 0)
            
            tileViewTransform(tiles[i], tx: tx, ty: ty, scale: scale, rotation: rotation)
        }
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func tileViewTransform(tileView: UIImageView, tx: Float, ty: Float, scale: Float, rotation: Float){
    
        tileView.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tileView.transform = CGAffineTransformScale(tileView.transform, CGFloat(scale), CGFloat(scale))
        tileView.transform = CGAffineTransformRotate(tileView.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        // called when scroll view grinds to a halt
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return introImageView
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
