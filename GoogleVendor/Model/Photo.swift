//
//  Photo.swift
//  GoogleVendor
//
//  Created by Lo Howard on 9/20/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import UIKit

struct Photo: Decodable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
    
    func getSmallImage(completion: @escaping (UIImage?) -> Void) {
        cache.downloadFrom(endpoint: thumbnailURL) { dat in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }
    }
    
    func getBiggerImage(completion: @escaping (UIImage?) -> Void) {
        cache.downloadFrom(endpoint: url) { dat in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }
    }
}
