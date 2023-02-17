import Foundation

extension RGB {
    public init?(hex: String) {
        var hex = hex.uppercased()[...]
        if hex.starts(with: "#") {
            hex = hex.dropFirst(1)
        }

        guard let value = UInt32(hex, radix: 16) else {
            return nil
        }

        self.init(value)
    }

    init(_ value: UInt32) {
        let red = (value & 0xFF0000) >> 16
        let green = (value & 0x00FF00) >> 8
        let blue = (value & 0x0000FF) >> 0

        self.init(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0
        )
    }

    func uint8(for value: Double) -> UInt8 {
        UInt8((value * 255.0).rounded())
    }

    var value: UInt32 {
        UInt32(uint8(for: self.red) << 16 | uint8(for: self.green) << 8 | uint8(for: self.blue) << 0)
    }

    public var hex: String {
        let r = String(format: "%02X", uint8(for: self.red))
        let g = String(format: "%02X", uint8(for: self.green))
        let b = String(format: "%02X", uint8(for: self.blue))
        return "#\(r)\(g)\(b)"
    }
}
