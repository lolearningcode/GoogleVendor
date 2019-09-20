//
//  ViewModel.swift
//  GoogleVendor
//
//  Created by Lo Howard on 9/20/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import Foundation

class ViewModel {
    
    var photos = [Photo]() {
        didSet {
            let userInfo: [String : ViewModel] = ["ViewModel" : self]
            NotificationCenter.default.post(name: Notification.Name.PhotoNotification, object: nil, userInfo: userInfo)
        }
    }
}
