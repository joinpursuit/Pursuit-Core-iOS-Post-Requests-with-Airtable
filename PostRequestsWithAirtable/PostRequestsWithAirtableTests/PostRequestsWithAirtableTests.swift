//
//  PostRequestsWithAirtableTests.swift
//  PostRequestsWithAirtableTests
//
//  Created by Benjamin Stone on 9/9/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import PostRequestsWithAirtable

class PostRequestsWithAirtableTests: XCTestCase {

    override func setUp() {}

    override func tearDown() {}

    func testGetProjects() {
        // Arrange
        guard let jsonPath = Bundle.main.path(forResource: "AirtableSampleResponse", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath)) else {
                fatalError("Test JSON data not found")
        }
        
        // Act
        var projects = [Project]()
        
        do {
            projects = try Project.getProjects(from: jsonData)
        }
        catch {
            print(error)
        }
        
        // Assert
        XCTAssertEqual(projects.count, 16, "Was expecting 16 projects, but found \(projects.count)")
    }
}
