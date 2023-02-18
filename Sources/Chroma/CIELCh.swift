import Darwin

/// The CIELCh° components of a color - lightness (L), chroma (C), and hue (h).
public struct CIELCh {
    /// The lightness component of the color, in the range [0, 100] (darkest to brightest).
    public let L: Double
    /// The chroma component of the color.
    public let C: Double
    /// The hue component of the color, in the range [0, 360°].
    public let h: Double

    /// Initializes a CIELCh from CIELCh°(ab) components.
    ///
    /// - parameter l: The lightness component of the color, in the range [0, 100] (darkest to brightest).
    /// - parameter c: The chroma component of the color.
    /// - parameter h: The hue component of the color, in the range [0, 360°].
    public init(L: Double, C: Double, h: Double) {
        self.L = L
        self.C = C
        self.h = h
    }
}

extension RGB {
    /// Initializes an RGB from CIELCh°(ab) components.
    ///
    /// - parameter l: The lightness component of the color, in the range [0, 100] (darkest to brightest).
    /// - parameter c: The chroma component of the color.
    /// - parameter h: The hue component of the color, in the range [0, 360°].
    public init(l: Double, c: Double, h: Double) {
        self.init(ab: CIELCh(L: l, C: c, h: h))
    }

    /// Calculates the CIELCh° components from a lightness value and a pair of chromaticity
    /// coordinates.
    ///
    /// - parameter L: The lightness value of the color.
    /// - parameter x: The x-axis chromaticity coordinate of the color.
    /// - parameter y: The y-axis chromaticity coordinate of the color.
    ///
    /// - returns: The CIELCh° components of the color.
    func LCh(L: Double, x: Double, y: Double) -> CIELCh {
        let C = sqrt((x * x) + (y * y))
        var h = atan2(y, x)

        if h.isNaN || C.isZero {
            h = 0.0
        } else if h >= 0.0 {
            h = rad2deg(h)
        } else {
            h = 360.0 - rad2deg(abs(h))
        }

        return CIELCh(L: L, C: C, h: h)
    }

    /// The CIELCh°(ab) components of the color using a d65 illuminant and 2° standard observer.
    ///
    /// - returns: A `CIELCh` instance.
    public var LCh_ab: CIELCh {
        let Lab = self.Lab
        return LCh(L: Lab.L, x: Lab.a, y: Lab.b)
    }

    /// Initializes a color from CIELCh°(ab) components.
    /// 
    /// - parameter LCh: The components used to initialize the color.
    /// - parameter alpha: The alpha value of the color.
    public init(ab LCh: CIELCh) {
        let a = LCh.C * cos(deg2rad(LCh.h))
        let b = LCh.C * sin(deg2rad(LCh.h))

        self.init(CIELAB(L: LCh.L, a: a, b: b))
    }
}

/// Converts degrees to radians. 1° × π/180 = 0.01745rad
///
/// - parameter degrees: The amount of degrees to convert to radians.
///
/// - returns: The amount of radians equal to the amount of degrees.
private func deg2rad(_ degrees: Double) -> Double {
    return degrees * .pi / 180.0
}

/// Converts radians to degrees. 1rad × 180/π = 57.296°
///
/// - parameter radians: The amount of radians to convert to degrees.
///
/// - returns: The amount of degrees equal to the amount of radians.
private func rad2deg(_ radians: Double) -> Double {
    return radians * 180.0 / .pi
}
