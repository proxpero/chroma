import Darwin

/// The CIELAB components of a color - lightness (L) and chromaticity (a,b).
public struct CIELAB {
    /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
    public let L: Double
    /// The green-red chromaticity component of the color, typically in the range [-128, 128].
    public let a: Double
    /// The blue-yellow chromaticity component of the color, typically in the range [-128, 128].
    public let b: Double

    /// Initializes a CIELAB from components.
    ///
    /// - parameter l: The lightness component of the color, in the range [0, 100] (darkest to brightest).
    /// - parameter a: The green-red chromaticity component of the color, typically in the range [-128, 128].
    /// - parameter b: The blue-yellow chromaticity component of the color, typically in the range [-128, 128].
    public init(L: Double, a: Double, b: Double) {
        self.L = L
        self.a = a
        self.b = b
    }
}

extension RGB {
    /// Initializes an RGB from CIELAB components.
    ///
    /// - parameter l: The lightness component of the color, in the range [0, 100] (darkest to brightest).
    /// - parameter a: The green-red chromaticity component of the color, typically in the range [-128, 128].
    /// - parameter b: The blue-yellow chromaticity component of the color, typically in the range [-128, 128].
    public init(l: Double, a: Double, b: Double) {
        self.init(CIELAB(L: l, a: a, b: b))
    }

    /// Initializes a color from CIELAB components.
    /// 
    /// - parameter Lab: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    public init(_ Lab: CIELAB) {
        func fn(_ t: Double) -> Double {
            if t > Constant.δ {
                return pow(t, 3.0)
            }

            return Constant.δ²3 * (t - Constant.⁴୵₂₉)
        }

        let ref = Constant.d65

        let L = (Lab.L + 16.0) / 116.0
        let a = L + (Lab.a / 500.0)
        let b = L - (Lab.b / 200.0)

        let X = fn(a) * ref.X
        let Y = fn(L) * ref.Y
        let Z = fn(b) * ref.Z

        self.init(CIEXYZ(X: X, Y: Y, Z: Z))
    }

    /// The CIELAB components of the color using a d65 illuminant and 2° standard observer.
    public var Lab: CIELAB {
        func fn(_ t: Double) -> Double {
            if t > Constant.δ³ {
                return pow(t, Constant.⅓)
            }

            return (t / Constant.δ²3) + Constant.⁴୵₂₉
        }

        let XYZ = self.XYZ
        let ref = Constant.d65

        let X = fn(XYZ.X / ref.X)
        let Y = fn(XYZ.Y / ref.Y)
        let Z = fn(XYZ.Z / ref.Z)

        let L = (116.0 * Y) - 16.0
        let a = 500.0 * (X - Y)
        let b = 200.0 * (Y - Z)

        return CIELAB(L: L, a: a, b: b)
    }
}
