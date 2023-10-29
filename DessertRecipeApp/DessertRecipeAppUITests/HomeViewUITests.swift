//
//  HomeViewUITests.swift
//  DessertRecipeAppUITests
//

import XCTest


final class HomeViewUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testTapFirstCardView() {
        let app = XCUIApplication()

        // Use the first CardView for testing
        let cardView = app.staticTexts["Apam balik"].firstMatch
        XCTAssertTrue(cardView.waitForExistence(timeout: 5), "CardView not found")

        // Tap the first card view
        cardView.tap()

        // Go back to HomeView
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }

    func testSortButton() {
        let app = XCUIApplication()

        // Tap the "Sort" button
        app.buttons["Sort"].tap()
    }

    func testSearchFunctionality() {
        let app = XCUIApplication()

        // Tap the search bar
        app.searchFields["Search"].tap()

        // Type a search query
        app.searchFields["Search"].typeText("Chocolate")
    }
    
    func testScrollViewScrolling() {
        let app = XCUIApplication()
        
        // Get the scroll view by its Accessibility Identifier
        let scrollView = app.scrollViews["DessertsScrollViewIdentifier"]
        XCTAssertTrue(scrollView.waitForExistence(timeout: 5), "ScrollView not found")
        
        // Scroll down
        scrollView.swipeUp()
        
    }
}
