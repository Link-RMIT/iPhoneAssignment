//
//  iPhoneAssignmentTests.swift
//  iPhoneAssignmentTests
//
//  Created by Yihui Lin on 21/03/2016.
//  Copyright © 2016 rmit. All rights reserved.
//

import XCTest
@testable import iPhoneAssignment



class iPhoneAssignmentTests: XCTestCase {
    
    var context:NSManagedObjectContext
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
        } catch {
            print("Adding in-memory persistent store failed")
        }
        
        let managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        self.context = managedObjectContext
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
   
    // Use XCTAssert and related functions to verify your tests produce the correct results.
   
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        
    }
    
    func testSessionModel() {

        let managedObjectContext = self.context
        //var mvId = "tt1234567"

        //Session.context = managedObjectContext
        
        //XCTAssert(Session.filter(Session.Fields.mvId, value: mvId).count == 0, "Movie session is empty.")
        //Session.randSession(<#T##mvId: String##String#>)
        //Session.appDelegate.saveContext()
        //XCTAssert(Session.filter(Session.Fields.mvId, value: mvId).count > 0, "Session for specific movie is created")
    }
    
    func testAlamofire() {
        
        //let mvId = "tt0090060"
        //var movieDetail:MovieDetail?
        //let expectation = expectationWithDescription("getMovieById")
        /*Alamofire.request(.GET,"https://www.omdbapi.com/",parameters:["plot": "full", "r": "json", "i":id]).responseJSON{ (response)-> Void in

        }*/
        //expectation.fulfill()

        //waitForExpectationsWithTimeout(5.0, handler: nil)
        //movieDetail?.imdbID = mvId
        
    }
    
}
