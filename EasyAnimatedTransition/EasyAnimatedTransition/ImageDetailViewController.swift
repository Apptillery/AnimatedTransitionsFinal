//
//  ImageDetailViewController.swift
//  EasyAnimatedTransition
//
//  Created by Alex Gibson on 3/29/17.
//  Copyright © 2017 AG. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.maximumZoomScale = 5.0
        scrollView.minimumZoomScale = 1.0
        scrollView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imgView.image = image
    }
    
    
    @IBAction func closeDidPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return containerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        adjustScrollViewInsets()
    }
    
    func adjustScrollViewInsets(){
        if scrollView.contentOffset.y < 0{
            let leftMargin = (scrollView.frame.size.width - self.containerView.frame.size.width) * 0.5
            let topMargin = (scrollView.frame.size.height - self.containerView.frame.size.height) * 0.5
            scrollView.contentInset = UIEdgeInsets(top: topMargin, left: leftMargin, bottom: 0, right: 0)
        }else{
            if scrollView.contentInset != .zero{
                scrollView.contentInset = .zero
            }
        }
    }

    
}
