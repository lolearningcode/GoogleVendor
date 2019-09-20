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

    @IBOutlet weak var fullScreenImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
