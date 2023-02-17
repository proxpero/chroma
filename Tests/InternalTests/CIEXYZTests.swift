import XCTest
@testable import Chroma

final class CIEXYZTests: XCTestCase {
    func testFFFFFF() throws {
        let color = "#FFFFFF"
        let xyz = try XCTUnwrap(RGB(hex: color)?.XYZ)
        XCTAssertEqual(xyz.X, 95.047, accuracy: 0.0001)
        XCTAssertEqual(xyz.Y, 100.000, accuracy: 0.0001)
        XCTAssertEqual(xyz.Z, 108.883, accuracy: 0.0001)
        XCTAssertEqual(RGB(xyz).hex, color)
    }

    func test000000() throws {
        let color = "#000000"
        let xyz = try XCTUnwrap(RGB(hex: color)?.XYZ)
        XCTAssertEqual(xyz.X, 0.0, accuracy: 0.0001)
        XCTAssertEqual(xyz.Y, 0.0, accuracy: 0.0001)
        XCTAssertEqual(xyz.Z, 0.0, accuracy: 0.0001)
        XCTAssertEqual(RGB(xyz).hex, color)
    }

    func test469CC9() throws {
        let color = "#469CC9"
        let xyz = try XCTUnwrap(RGB(hex: color)?.XYZ)
        XCTAssertEqual(xyz.X, 24.95277003764898, accuracy: 0.0001)
        XCTAssertEqual(xyz.Y, 29.29346833896403, accuracy: 0.0001)
        XCTAssertEqual(xyz.Z, 59.58618038515691, accuracy: 0.0001)
        XCTAssertEqual(RGB(xyz).hex, color)
    }
}
