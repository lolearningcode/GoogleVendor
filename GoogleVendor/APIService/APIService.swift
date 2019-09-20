//
//  APIService.swift
//  GoogleVendor
//
//  Created by Lo Howard on 9/20/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import Foundation

typealias PhotoHandler = ([Photo]) -> Void

final class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func fetchPhotos(completion: @escaping PhotoHandler) {
        let url = "https://jsonplaceholder.typicode.com/photos"
        
        guard let finalURL = URL(string: url) else { return }
        
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            if let error = error {
                print("ERROR FETCHING PHOTOS \(error)")
                return
            }
            
            if let data = data {
                do {
                    let photoData = try JSONDecoder().decode([Photo].self, from: data)
                    completion(photoData)
                } catch {
                    print("Couldn't Decode Photos: \(error)")
                    return
                }
            }
        }.resume()
    }
}
