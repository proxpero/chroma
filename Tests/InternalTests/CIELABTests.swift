import XCTest
@testable import Chroma

final class CIELABTests: XCTestCase {
    func testFFFFFF() throws {
        let color = "#FFFFFF"
        let lab = try XCTUnwrap(RGB(hex: color)?.Lab)
        XCTAssertEqual(lab.L, 100.000, accuracy: 0.0001)
        XCTAssertEqual(lab.a, 0.000, accuracy: 0.0001)
        XCTAssertEqual(lab.b, 0.000, accuracy: 0.0001)
        XCTAssertEqual(RGB(lab).hex, color)
    }

    func test000000() throws {
        let color = "#000000"
        let lab = try XCTUnwrap(RGB(hex: color)?.Lab)
        XCTAssertEqual(lab.L, 0.0, accuracy: 0.0001)
        XCTAssertEqual(lab.a, 0.0, accuracy: 0.0001)
        XCTAssertEqual(lab.b, 0.0, accuracy: 0.0001)
        XCTAssertEqual(RGB(lab).hex, color)
    }

    func test469CC9() throws {
        let color = "#469CC9"
        let lab = try XCTUnwrap(RGB(hex: color)?.Lab)
        XCTAssertEqual(lab.L, 61.03975995524921, accuracy: 0.0001)
        XCTAssertEqual(lab.a, -11.910597096554397, accuracy: 0.0001)
        XCTAssertEqual(lab.b, -30.763480391218856, accuracy: 0.0001)
        XCTAssertEqual(RGB(lab).hex, color)
    }
}
