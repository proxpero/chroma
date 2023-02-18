import Darwin

/// The CIE 1931 XYZ components of a color - luminance (Y) and chromaticity (X,Z).
public struct CIEXYZ: Equatable {
    /// A mix of cone response curves chosen to be orthogonal to luminance and
    /// non-negative, in the range [0, 95.047].
    public let X: Double
    /// The luminance component of the color, in the range [0, 100].
    public let Y: Double
    /// Somewhat equal to blue, or the "S" cone response, in the range [0, 108.883].
    public let Z: Double

    /// Initializes a CIEXYZ with the CIE 1931 XYZ components of a color.
    ///
    /// - parameter x: A mix of cone response curves chosen to be orthogonal to luminance and non-negative, in the range [0, 95.047].
    /// - parameter y: The luminance component of the color, in the range [0, 100].
    /// - parameter z: Somewhat equal to blue, or the "S" cone response, in the range [0, 108.883].
    public init(X: Double, Y: Double, Z: Double) {
        self.X = X
        self.Y = Y
        self.Z = Z
    }
}

extension RGB {
    /// Initializes an RGB with the CIE 1931 XYZ components of a color.
    ///
    /// - parameter x: A mix of cone response curves chosen to be orthogonal to luminance and non-negative, in the range [0, 95.047].
    /// - parameter y: The luminance component of the color, in the range [0, 100].
    /// - parameter z: Somewhat equal to blue, or the "S" cone response, in the range [0, 108.883].
    public init(x: Double, y: Double, z: Double) {
        let x = max(0, min(95.047, x))
        let y = max(0, min(100.000, y))
        let z = max(0, min(108.883, z))
        self.init(CIEXYZ(X: x, Y: y, Z: z))
    }

    /// Initialize an RGB with the CIE 1931 XYZ components of a color.
    ///
    /// - parameter ciexyz: A `CIEXYZ` instance.
    public init(_ ciexyz: CIEXYZ) {
        let X = ciexyz.X / 100.0
        let Y = ciexyz.Y / 100.0
        let Z = ciexyz.Z / 100.0

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        var r =  (3.2404542 * X) - (1.5371385 * Y) - (0.4985314 * Z)
        var g = (-0.9692660 * X) + (1.8760108 * Y) + (0.0415560 * Z)
        var b =  (0.0556434 * X) - (0.2040259 * Y) + (1.0572252 * Z)

        // sRGB (D65) gamma correction - companding to get non-linear values
        let k = 1.0 / 2.4
        r = (r <= 0.00304) ? (12.92 * r) : (1.055 * pow(r, k) - 0.055)
        g = (g <= 0.00304) ? (12.92 * g) : (1.055 * pow(g, k) - 0.055)
        b = (b <= 0.00304) ? (12.92 * b) : (1.055 * pow(b, k) - 0.055)

        self.init(red: r, green: g, blue: b)
    }

    /// The CIE 1931 XYZ components of the color.
    public var XYZ: CIEXYZ {
        // sRGB (D65) gamma correction - inverse companding to get linear values
        let r = (self.red > 0.03928) ? pow((self.red + 0.055) / 1.055, 2.4) : (self.red / 12.92)
        let g = (self.green > 0.03928) ? pow((self.green + 0.055) / 1.055, 2.4) : (self.green / 12.92)
        let b = (self.blue > 0.03928) ? pow((self.blue + 0.055) / 1.055, 2.4) : (self.blue / 12.92)

        // sRGB (D65) matrix transformation
        // http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
        let X = (0.4124564 * r) + (0.3575761 * g) + (0.1804375 * b)
        let Y = (0.2126729 * r) + (0.7151522 * g) + (0.0721750 * b)
        let Z = (0.0193339 * r) + (0.1191920 * g) + (0.9503041 * b)

        return CIEXYZ(
            X: X * 100.0,
            Y: Y * 100.0,
            Z: Z * 100.0
        )
    }
}
