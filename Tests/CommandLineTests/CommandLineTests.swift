import XCTest
@testable import CommandLine

class CommandLineTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(CommandLine().text, "Hello, World!")
    }


    static var allTests : [(String, (CommandLineTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
