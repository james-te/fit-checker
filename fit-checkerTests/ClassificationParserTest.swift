//
//  ClassificationParserTest.swift
//  fit-checker
//
//  Created by Jakub Tucek on 13/01/17.
//  Copyright © 2017 Josef Dolezal. All rights reserved.
//

import XCTest

class ClassificationParserTest: XCTestCase {

    let parser = ClassificationParser()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    private func readFile(name: String) -> String {
        let testBundle = Bundle(for: type(of: self))
        guard let ressourceURL = testBundle.url(forResource: name, withExtension: "html") else {
            // file does not exist
            return ""
        }
        do {
            let resourceData = try Data(contentsOf: ressourceURL)
            let datastring = String(data: resourceData, encoding: .utf8)

            return datastring!
        } catch _ {
            // some error occurred when reading the file
        }

        return ""
    }


    func testOMO() {
        let omoPage = readFile(name: "biomo")

        let result = parser.parseEdux(html: omoPage)


        print(result)


        XCTAssertEqual(1, result.tables.count)

        XCTAssertEqual(6, result.tables[0].rows.count)
        XCTAssertEqual("tutorial", result.tables[0].name!)

        XCTAssertEqual("test", result.tables[0].rows[0].name)
        XCTAssertEqual("-", result.tables[0].rows[0].value)

        XCTAssertEqual("1kon", result.tables[0].rows[1].name)
        XCTAssertEqual("-", result.tables[0].rows[1].value)

        XCTAssertEqual("2kon", result.tables[0].rows[2].name)
        XCTAssertEqual("-", result.tables[0].rows[2].value)

        XCTAssertEqual("odevzdano", result.tables[0].rows[3].name)
        XCTAssertEqual("-", result.tables[0].rows[3].value)

        XCTAssertEqual("hodnoceni", result.tables[0].rows[4].name)
        XCTAssertEqual("-", result.tables[0].rows[4].value)

        XCTAssertEqual("zapocet", result.tables[0].rows[5].name)
        XCTAssertEqual("-", result.tables[0].rows[5].value)

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