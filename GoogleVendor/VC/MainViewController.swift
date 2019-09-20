//
//  MainViewController.swift
//  GoogleVendor
//
//  Created by Lo Howard on 9/20/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var gridContainerView: UIView!
    @IBOutlet weak var listContainerView: UIView!
    
    let viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService.shared.fetchPhotos { (photo) in
            self.viewModel.photos = photo
            print(photo.count)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchToggleTapped(_ sender: UIBarButtonItem) {
        gridContainerView.isHidden.toggle()
        listContainerView.isHidden.toggle()
    }
}
