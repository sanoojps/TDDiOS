//
//  PeopleTests.swift
//  TDDiOSTests
//
//  Created by sanooj on 11/13/17.
//  Copyright © 2017 sanooj. All rights reserved.
//

import XCTest
@testable import TDDiOS

class PersonTests: XCTestCase {
    
    static let name =
    "Graham Lee"
    
    static let avatar =
    "http://example.com/avatar.png"
    
    var person: Person! = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.person =
        Person.init(withName: PersonTests.name, andAvatar: PersonTests.avatar)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        self.person =
        nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension PersonTests
{
    func testThatPersonHasAName()
    {
        XCTAssertEqual(self.person.name, PersonTests.name, "person should have a name")
    }
    
    func testThatPersonHasAnAvatarURL()
    {
        
        guard let url :URL = person.avatar else
        {
            XCTAssertNotNil(person.avatar)
            return
        }
        
        XCTAssertEqual(url.absoluteString, PersonTests.avatar, "person should have an avatar")
    }
}
