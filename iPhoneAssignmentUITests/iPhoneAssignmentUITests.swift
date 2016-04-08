//
//  iPhoneAssignmentUITests.swift
//  iPhoneAssignmentUITests
//
//  Created by Yihui Lin on 21/03/2016.
//  Copyright © 2016 rmit. All rights reserved.
//

import XCTest

class iPhoneAssignmentUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testExample() {
    }
    func testViewingMovie() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["St. Elmo's Fire"].tap()
        
        let movieListButton = app.navigationBars["iPhoneAssignment.MovieDetail"].buttons["Movie list"]
        movieListButton.tap()
        tablesQuery.staticTexts["Dune"].tap()
        movieListButton.tap()
        tablesQuery.staticTexts["Stargate"].tap()
        movieListButton.tap()
        tablesQuery.staticTexts["Billy Elliot"].tap()
        movieListButton.tap()
        
        
    }
    func testBooking(){
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Dune"].tap()
        app.buttons["Book"].tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(1).staticTexts["DD/MM/YYYY"].tap()
        
        let element = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element
        let textField = element.childrenMatchingType(.TextField).elementBoundByIndex(0)
        textField.tap()
        textField.tap()
        textField.typeText("3")
        
        let textField2 = element.childrenMatchingType(.TextField).elementBoundByIndex(1)
        textField2.tap()
        textField2.tap()
        textField2.typeText("3456265")
        app.buttons["Confirm"].tap()
        
    }
    func testViewBookingHistory(){
        
        let app = XCUIApplication()
        app.tabBars.buttons["History"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(4).staticTexts["St. Elmo's Fire"].tap()
        
        let movieDetailButton = app.navigationBars["UIView"].buttons["Movie Detail"]
        movieDetailButton.tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(7).staticTexts["St. Elmo's Fire"].tap()
        movieDetailButton.tap()
        
    }
}
