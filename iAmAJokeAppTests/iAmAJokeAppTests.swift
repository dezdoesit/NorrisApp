//
//  iAmAJokeAppTests.swift
//  iAmAJokeAppTests
//
//  Created by dmoney on 4/27/24.
//

import XCTest
@testable import iAmAJokeApp

 class iAmAJokeAppTests: XCTestCase {
     var viewModel: JokeViewModel!

     @MainActor override func setUpWithError() throws {
         super.setUp()
         UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
         UserDefaults.standard.synchronize()

         let config = URLSessionConfiguration.ephemeral
         config.protocolClasses = [MockURLProtocol.self]
         let session = URLSession(configuration: config)

         let apiManager = CNAPIManager(session: session)
         viewModel = JokeViewModel(apiManager: apiManager)
     }

     func testFetchJoke() async {
         let sampleJokeData = """
         {
            "id": "1",
            "value": "Test Joke"
         }
         """.data(using: .utf8)!
         MockURLProtocol.stubResponseData = sampleJokeData

         await viewModel.fetchJokes()

         XCTAssertFalse(viewModel.jokes.isEmpty, "No jokes were fetched")
         XCTAssertEqual(viewModel.jokes.count, 3)
         XCTAssertEqual(viewModel.jokes.first?.value, "Test Joke")
         XCTAssertNil(viewModel.errorMessage)
     }

     override func tearDownWithError() throws {
         viewModel = nil
         super.tearDown()
     }

}
