//
//  GoogleVendorTests.swift
//  GoogleVendorTests
//
//  Created by Lo Howard on 9/19/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

import XCTest
@testable import GoogleVendor

class GoogleVendorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhotoArray() {
        let viewModel = ViewModel()
        XCTAssertTrue(!viewModel.photos.isEmpty)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        var photos = [Photo]()
        
        self.measure {
            // Put the code you want to measure the time of here.
            
            for photo in photos {
                photos.append(photo)
            }
            
            XCTAssertTrue(photos.count > 1)
        }
    }
    
    func testPhotoServiceCall() {
        var photos = [Photo]()
        
        let promise = expectation(description: "wait for service call")
        
        APIService.shared.fetchPhotos { (fotos) in
            photos = fotos
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil) // wait for expectation to be fulfilled for 3 seconds
        
        XCTAssert(photos.count > 0)
    }
}
