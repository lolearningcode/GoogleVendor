//
//  PhotoCollectionViewCell.swift
//  GoogleVendor
//
//  Created by Lo Howard on 9/20/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoId: UILabel!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    var photo: Photo! {
        didSet {
            photoId.text = "\(photo.id)"
            photoTitle.text = photo.title
            
            photo.getSmallImage { [weak self] (img) in
                self?.photoImage.image = img
            }
        }
    }
}
