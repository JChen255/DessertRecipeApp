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
        viewModel = RecipeDetailViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testIngredients() {
        // Create a sample Recipe with ingredients for testing.
        let recipe = Recipe(name: "Test Recipe",
                            category: "Test Category",
                            area: "Test Area",
                            instruction: "Test Instruction",
                            thumbnailUrl: "Test Thumbnail",
                            ingredient1: "Plain Flour",
                            ingredient2: "Caster Sugar",
                            ingredient3: "Butter",
                            ingredient4: "",
                            ingredient5: "",
                            ingredient6: "",
                            ingredient7: "",
                            ingredient8: "",
                            ingredient9: "",
                            ingredient10: "",
                            ingredient11: "",
                            ingredient12: nil,
                            ingredient13: "",
                            ingredient14: "",
                            ingredient15: nil,
                            ingredient16: nil,
                            ingredient17: nil,
                            ingredient18: "",
                            ingredient19: nil,
                            ingredient20: "",
                            measure1: "120g",
                            measure2: "60g",
                            measure3: "30g",
                            measure4: "",
                            measure5: "",
                            measure6: "",
                            measure7: "",
                            measure8: "",
                            measure9: nil,
                            measure10: "",
                            measure11: "",
                            measure12: nil,
                            measure13: "",
                            measure14: "",
                            measure15: nil,
                            measure16: "",
                            measure17: nil,
                            measure18: "",
                            measure19: "",
                            measure20: nil
                            )
        
        // Set the recipe in the view model.
        viewModel.recipes = [recipe]
        
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
