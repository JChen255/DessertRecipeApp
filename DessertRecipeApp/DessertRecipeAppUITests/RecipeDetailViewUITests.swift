//
//  RecipeDetailViewUITests.swift
//  DessertRecipeAppUITests
//


import XCTest

final class RecipeDetailViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testRecipeDetailView() {
        // Tap the first dessert in the HomeView
        let cardView = app.staticTexts["Apam balik"].firstMatch
        XCTAssertTrue(cardView.waitForExistence(timeout: 5), "CardView not found")

        // Tap the first card view
        cardView.tap()

        // Test switching between Instruction and Ingredients
        let instructionButton = app.buttons["Instruction"]
        let ingredientsButton = app.buttons["Ingredients"]

        // Tap Ingredients
        ingredientsButton.tap()
        
        // Tap Instruction
        instructionButton.tap()

        // Go back to HomeView
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }

    override func tearDown() {
        super.tearDown()
    }
}
