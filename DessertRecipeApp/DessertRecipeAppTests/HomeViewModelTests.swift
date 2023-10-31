//
//  HomeViewModelTests.swift
//  DessertRecipeAppTests
//

import XCTest
@testable import DessertRecipeApp

final class HomeViewModelTests: XCTestCase {
    var homeViewModel: HomeViewModel!

    @MainActor override func setUp() {
        super.setUp()
        homeViewModel = HomeViewModel()
    }

    override func tearDown() {
        homeViewModel = nil
        super.tearDown()
    }

    @MainActor func testFilterDesserts() {
        // Set the keyword
        homeViewModel.keyword = "Chocolate"
        
        // Ensure that filteredDesserts only contain desserts with "Chocolate" in their name
        XCTAssertEqual(homeViewModel.filteredDesserts.count, homeViewModel.desserts.filter { $0.name.lowercased().contains("chocolate") }.count)
    }

    @MainActor func testSortDesserts() {
        // Set isSorted to true
        homeViewModel.isSorted = true

        // Ensure that sortedDesserts is in reverse order compared to filteredDesserts
        XCTAssertEqual(homeViewModel.sortedDesserts, homeViewModel.filteredDesserts.reversed())
    }
}
