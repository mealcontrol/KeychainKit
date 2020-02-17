import XCTest
@testable import KeychainKit

final class KeychainKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(KeychainKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
