//
//  iAmAJokeAppUITests.swift
//  iAmAJokeAppUITests
//
//  Created by dmoney on 4/27/24.
//

import XCTest

final class iAmAJokeAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    func testExample() throws {
        let app = XCUIApplication()

        XCTAssert(app.staticTexts["Welcome to Chuck Norris Jokes! 🥊👊🏽"].exists)
        XCTAssert(app.buttons["Get Started"].exists)


    }

    override func tearDownWithError() throws {
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
