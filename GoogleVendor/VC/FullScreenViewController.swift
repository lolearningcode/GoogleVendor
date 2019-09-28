//
//  FullScreenViewController.swift
//  GoogleVendor
//
//  Created by Lo Howard on 9/20/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    var photo: Photo! {
        didSet {
            photo.getBiggerImage { [weak self] (image) in
                DispatchQueue.main.async {
                    self?.fullScreenImage.image = image
                }
            }
        }
    }

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fullScreenImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 6
        // Do any additional setup after loading the view.
    }
}

extension FullScreenViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return fullScreenImage
    }
}
