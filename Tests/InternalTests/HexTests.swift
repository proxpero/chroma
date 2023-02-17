import XCTest
@testable import Chroma

final class HexTests: XCTestCase {
    func testRoundtrip() {
        XCTAssertEqual("#FF0000", RGB(hex: "#FF0000")?.hex)
        XCTAssertEqual("#00FF00", RGB(hex: "#00FF00")?.hex)
        XCTAssertEqual("#0000FF", RGB(hex: "#0000FF")?.hex)
        XCTAssertEqual("#DEADBE", RGB(hex: "#DEADBE")?.hex)
        XCTAssertEqual("#DEADBE", RGB(hex: "DEADBE")?.hex)
        XCTAssertEqual("#DEADBE", RGB(hex: "deadbe")?.hex)
        XCTAssertNil(RGB(hex: "#CHROMA"))
    }

    func testValues() {
        let rgb = RGB(hex: "469CC9")
        XCTAssertEqual(rgb?.red, 0.27450980392156865)
        XCTAssertEqual(rgb?.green, 0.611764705882353)
        XCTAssertEqual(rgb?.blue, 0.788235294117647)
    }
}
