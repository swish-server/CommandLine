import XCTest
@testable import CommandLine

class CommandLineTests: XCTestCase {

    func testRunCommand() {
        let runExpectation = expectation(description: "Run <ls> to see files in current directory.")

        let commandLine = CommandLine()
        let command = "/usr/bin/env"
        let arguments = [ "ls" ]
        let result = commandLine.execute(command, with: arguments)

        switch result {
        case .output(let output):
            runExpectation.fulfill()
            print(output)
        case .error(let message):
            print("Error: \(message)")
        }

        waitForExpectations(timeout: 1.0)
    }

    static var allTests : [(String, (CommandLineTests) -> () throws -> Void)] {
        return [
            ("testRunCommand", testRunCommand),
        ]
    }

}
