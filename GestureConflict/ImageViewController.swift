//
//  ImageViewController.swift
//  GestureConflict
//
//  Created by HLH on 2017/2/22.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit
import PhotoBrowser

class ImageViewController: UIViewController {

    let imageView  = UIImageView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initialize() {
        view.backgroundColor = .lightGray
        
        let array = ["http://odvxpvqb8.qnssl.com/%E7%86%8A%E7%8C%AB%E9%95%87/%E6%89%AF%E7%9D%80%E6%B7%A1/_image/%E6%8A%B5%E5%88%B6.jpg","http://odvxpvqb8.qnssl.com/%E7%86%8A%E7%8C%AB%E9%95%87/%E6%89%AF%E7%9D%80%E6%B7%A1/_image/%E7%8B%BC%E6%9D%A5%E4%BA%86.jpg","http://odvxpvqb8.qnssl.com/%E7%86%8A%E7%8C%AB%E9%95%87/%E6%89%AF%E7%9D%80%E6%B7%A1/_image/%E5%AF%BC%E6%B8%B8.jpg"]
        let pageController = PBPageViewController.init(sourceData: array as NSArray?, currentPhotoUrl: "http://odvxpvqb8.qnssl.com/%E7%86%8A%E7%8C%AB%E9%95%87/%E6%89%AF%E7%9D%80%E6%B7%A1/_image/%E5%AF%BC%E6%B8%B8.jpg", showStyle: PBStyle.OnlyPhotoStyle)
        pageController.showInViewController(viewController: self)
    }

}
