//
//  PhotoTableViewCell.swift
//  GoogleVendor
//
//  Created by Lo Howard on 9/20/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoID: UILabel!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    var photo: Photo! {
        didSet {
            photoID.text = "\(photo.id)"
            photoTitle.text = photo.title
            
            photo.getSmallImage { [weak self] (img) in
                self?.photoImage.image = img
            }
        }
    }

}
