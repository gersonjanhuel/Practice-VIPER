//
//  MVC_ProjectTests.swift
//  MVC-ProjectTests
//
//  Created by Gerson Janhuel on 28/08/20.
//

import XCTest
@testable import MVC_Project

class MVC_ProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // rename it with your test case name 
    func testExample() throws {
        // pretend you have a model
        let course = Course(id: 1, name: "Name of the course", number_of_lessons: 45)
        let courseModel = CourseViewModel(course: course)
        
        // now what to test ?
        XCTAssertEqual(course.name, courseModel.name)
    }


}
