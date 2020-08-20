//
//  GitHubStarsTests.swift
//  GitHubStarsTests
//
//  Created by Ana Finotti on 19/08/20.
//  Copyright © 2020 ian. All rights reserved.
//

import XCTest
@testable import GitHubStars

class GitHubStarsTests: XCTestCase {
    
    var repositories: [GitHubModel]!
    /*
     
     var vehicle: Vehicle!
     
     override func setUp() {
     super.setUp()
     vehicle = Car(wheels: 4)
     }
     
     func testVehicleHasPossitiveNumberOfWheels() {
     
     XCTAssertTrue(vehicle.numberOfWheels > 0)
     }
     
     func testVehicleIsDrivable() {
     
     guard let driveableVehicle = (vehicle as? Driveable) else {
     XCTFail()
     return
     }
     
     XCTAssertNotNil(driveableVehicle)
     }
     */
    
    override func setUp() {
        
        super.setUp()
        
        let repository = GitHubModel(name: "name", owner: Owner(login: "owner name", avatarUrl: ""), stargazersCount: 2000)
        
        self.repositories = [GitHubModel]()
        
        self.repositories.append(repository)
    }
    
    func testRepositoriesCountIsMoreThanZero() {
        
        XCTAssertTrue(self.repositories.count > 0)
    }
    
    func testIfRepositoryHasOwner() {
        
        for repository in self.repositories {
            
            guard repository.owner != nil else {
                
                XCTFail()
                return
            }
            
            XCTAssertNotNil(repository.owner)
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
