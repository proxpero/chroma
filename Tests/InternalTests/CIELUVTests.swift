import XCTest
@testable import Chroma

final class CIELUVTests: XCTestCase {
    func testFFFFFF() throws {
        let color = "#FFFFFF"
        let luv = try XCTUnwrap(RGB(hex: color)?.Luv)
        XCTAssertEqual(luv.L, 100, accuracy: 0.0001)
        XCTAssertEqual(luv.u, 0.0, accuracy: 0.0001)
        XCTAssertEqual(luv.v, 0.0, accuracy: 0.0001)
        XCTAssertEqual(RGB(luv).hex, color)
    }

    func test000000() throws {
        let color = "#000000"
        let luv = try XCTUnwrap(RGB(hex: color)?.Luv)
        XCTAssertEqual(luv.L, 0.0, accuracy: 0.0001)
        XCTAssertEqual(luv.u, 0.0, accuracy: 0.0001)
        XCTAssertEqual(luv.v, 0.0, accuracy: 0.0001)
        XCTAssertEqual(RGB(luv).hex, color)
    }

    func test469CC9() throws {
        let color = "#469CC9"
        let luv = try XCTUnwrap(RGB(hex: color)?.Luv)
        XCTAssertEqual(luv.L, 61.03975995524921, accuracy: 0.0001)
        XCTAssertEqual(luv.u, -33.83555601210742, accuracy: 0.0001)
        XCTAssertEqual(luv.v, -46.33433838534826, accuracy: 0.0001)
        XCTAssertEqual(RGB(luv).hex, color)
    }
}
