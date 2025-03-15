//
//  CharacterViewModelTests.swift
//  PayStackAssignmentTests
//
//  Created by Sushant V. Jagtap on 15/03/25.
//

import XCTest
@testable import PayStackAssignment

class CharacterViewModelTests: XCTestCase {
    
    var viewModel: CharacterViewModel!
    var mockService: MockCharacterService!
    
    override func setUp() {
        super.setUp()
        mockService = MockCharacterService()
        viewModel = CharacterViewModel(characterService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    // Test that the ViewModel successfully fetches characters
    func testFetchCharactersSuccess() {
        // Given
        let characters = [
            Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human"),
            Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human")
        ]
        mockService.mockResult = .success(characters)
        
        // Create an expectation for the async operation
        let expectation = self.expectation(description: "Characters fetched")
        
        // When
        viewModel.fetchCharacters()
        
        // Then
        // Wait for the async operation to finish (5 seconds timeout)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.characters.count, 2)
            XCTAssertEqual(self.viewModel.characters.first?.name, "Rick Sanchez")
            XCTAssertEqual(self.viewModel.characters.first?.status, "Alive")
            XCTAssertEqual(self.viewModel.characters.first?.species, "Human")
            XCTAssertNil(self.viewModel.errorMessage)
            
            // Fulfill the expectation to indicate the async operation is complete
            expectation.fulfill()
        }
        
        // Wait for expectations with a timeout
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Test that the ViewModel handles error while fetching characters
    func testFetchCharactersFailure() {
        // Given
        mockService.mockResult = .failure(NetworkError.noData)
        
        let expectation = self.expectation(description: "No Data")
        
        // When
        viewModel.fetchCharacters()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.characters.count, 0)
            XCTAssertNotNil(self.viewModel.errorMessage)
            XCTAssertEqual(self.viewModel.errorMessage, "The operation couldn’t be completed. (PayStackAssignment.NetworkError error 1.)")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)

    }
    
    // Test that the ViewModel handles empty character list successfully
    func testFetchCharactersEmptyList() {
        // Given
        mockService.mockResult = .success([])
        
        // When
        viewModel.fetchCharacters()
        
        // Then
        XCTAssertEqual(viewModel.characters.count, 0)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    // Test that the ViewModel does not update characters when an invalid URL or network error occurs
    func testFetchCharactersNetworkError() {
        // Given
        mockService.mockResult = .failure(NetworkError.invalidURL)
        
        let expectation = self.expectation(description: "Invalid URL")
        
        // When
        viewModel.fetchCharacters()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.characters.count, 0)
            XCTAssertNotNil(self.viewModel.errorMessage)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Test that the ViewModel handles no data scenario correctly
    func testFetchCharactersNoData() {
        // Given
        mockService.mockResult = .failure(NetworkError.noData)
        
        let expectation = self.expectation(description: "No Data")
        
        // When
        viewModel.fetchCharacters()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.characters.count, 0)
            XCTAssertNotNil(self.viewModel.errorMessage)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
