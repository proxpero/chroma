/// A set of constant values used to convert to and from color values.
struct Constant {
    static let d65 = CIEXYZ(X: 95.047, Y: 100.000, Z: 108.883)
    static let ⅓ = 1.0 / 3.0
    static let ϵ = 216.0 / 24389.0
    static let κ = 24389.0 / 27.0

    static func fu(_ XYZ: CIEXYZ) -> Double {
        return (4.0 * XYZ.X) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
    }

    static func fv(_ XYZ: CIEXYZ) -> Double {
        return (9.0 * XYZ.Y) / (XYZ.X + (15.0 * XYZ.Y) + (3.0 * XYZ.Z))
    }

    static let ⁴୵₂₉ = 4.0 / 29.0
    static let δ = 6.0 / 29.0
    static let δ³ = δ * δ * δ
    static let δ²3 = δ * δ * 3.0
}
