import XCTest
@testable import Chroma

final class CIELABTests: XCTestCase {
    func testCIELAB() {
        XCTAssertEqual(RGB(l: 100, a: 0, b: 0).hex, "#FFFFFF")
        XCTAssertEqual(RGB(l: 0, a: 0, b: 0).hex, "#000000")
        XCTAssertEqual(RGB(l: 61.04, a: -12, b: -30.7).hex, "#469CC9")
    }

    func testCIELCh() {
        XCTAssertEqual(RGB(l: 100, c: 0, h: 158.2).hex, "#FFFFFF")
        XCTAssertEqual(RGB(l: 0, c: 0, h: 0).hex, "#000000")
        XCTAssertEqual(RGB(l: 61.04, c: 33, h: 248.84).hex, "#469CC9")
    }

    func testCIELUV() {
        XCTAssertEqual(RGB(l: 100, u: 0, v: 0).hex, "#FFFFFF")
        XCTAssertEqual(RGB(l: 0, u: 0, v: 0).hex, "#000000")
        XCTAssertEqual(RGB(l: 61.04, u: -33.8, v: -46.33).hex, "#469CC9")
    }

    func testCIEXYZ() {
        XCTAssertEqual(RGB(x: 95.047, y: 100, z: 108.883).hex, "#FFFFFF")
        XCTAssertEqual(RGB(x: 0, y: 0, z: 0).hex, "#000000")
        XCTAssertEqual(RGB(x: 24.95277003764898, y: 29.29346833896403, z: 59.58618038515691).hex, "#469CC9")
    }
}
