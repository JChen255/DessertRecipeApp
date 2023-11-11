//
//  RecipeDetailViewModelTests.swift
//  DessertRecipeAppTests
//
import XCTest
@testable import DessertRecipeApp

class RecipeDetailViewModelTests: XCTestCase {
    
    var viewModel: RecipeDetailViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = RecipeDetailViewModel(dataService: MockAPIService.shared)
        
        let expectation = XCTestExpectation(description: "Fetch recipes")

        // Fetch data asynchronously
        Task {
            await viewModel.fetchRecipes(for: "mockRecipeId")
            expectation.fulfill() // Fulfill the expectation when data is fetched
        }

        // Wait for the expectations to be fulfilled
        wait(for: [expectation], timeout: 5.0) // Adjust timeout as needed
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testIngredients() {
        
        // Get the ingredients from the view model.
        let ingredients = viewModel.ingredients
        
        // Ensure there are three ingredients.
        XCTAssertEqual(ingredients.count, 3, "Unexpected number of ingredients")
        
        // Check the values of the first ingredient.
        XCTAssertEqual(ingredients[0].name, "Plain Flour")
        XCTAssertEqual(ingredients[0].measurement, "120g")
        
        // Check the values of the second ingredient.
        XCTAssertEqual(ingredients[1].name, "Caster Sugar")
        XCTAssertEqual(ingredients[1].measurement, "60g")
        
        // Check the values of the third ingredient.
        XCTAssertEqual(ingredients[2].name, "Butter")
        XCTAssertEqual(ingredients[2].measurement, "30g")
    }
}
