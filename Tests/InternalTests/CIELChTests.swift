import XCTest
@testable import Chroma

final class CIELChTests: XCTestCase {
    func testFFFFFF() throws {
        let color = "#FFFFFF"
        let lch = try XCTUnwrap(RGB(hex: color)?.LCh_ab)
        XCTAssertEqual(lch.L, 100, accuracy: 0.0001)
        XCTAssertEqual(lch.C, 0.0, accuracy: 0.0001)
        XCTAssertEqual(lch.h, 158.19859051364818, accuracy: 0.0001)
        XCTAssertEqual(RGB(ab: lch).hex, color)
    }

    func test000000() throws {
        let color = "#000000"
        let lch = try XCTUnwrap(RGB(hex: color)?.LCh_ab)
        XCTAssertEqual(lch.L, 0.0, accuracy: 0.0001)
        XCTAssertEqual(lch.C, 0.0, accuracy: 0.0001)
        XCTAssertEqual(lch.h, 0.0, accuracy: 0.0001)
        XCTAssertEqual(RGB(ab: lch).hex, color)
    }

    func test469CC9() throws {
        let color = "#469CC9"
        let lch = try XCTUnwrap(RGB(hex: color)?.LCh_ab)
        XCTAssertEqual(lch.L, 61.03975995524921, accuracy: 0.0001)
        XCTAssertEqual(lch.C, 32.988695775634376, accuracy: 0.0001)
        XCTAssertEqual(lch.h, 248.8352528211964, accuracy: 0.0001)
        XCTAssertEqual(RGB(ab: lch).hex, color)
    }
}
