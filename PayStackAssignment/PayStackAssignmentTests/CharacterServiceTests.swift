//
//  CharacterServiceTests.swift
//  PayStackAssignmentTests
//
//  Created by Sushant V. Jagtap on 15/03/25.
//

import XCTest
@testable import PayStackAssignment

 class CharacterServiceTests: XCTestCase {
    
    // MARK: - Properties
    var service: CharacterService!
    
    // MARK: - Lifecycle Methods
    override func setUp() {
        super.setUp()
        service = CharacterService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    // MARK: - Test cases methods
    func testFetchCharactersSuccess() {
        let expectation = self.expectation(description: "Fetch characters")
        
        service.fetchCharacters { result in
            switch result {
            case .success(let characters):
                XCTAssertGreaterThan(characters.count, 0)
            case .failure:
                XCTFail("Expected success, but got failure")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchCharactersFailure() {
        // Simulate failure by passing a wrong URL or a mock server
    }
    
}
