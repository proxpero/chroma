extension RGB {
    /// Initializes a color from CIELUV components.
    /// - parameter l: The lightness component of the color, in the range [0, 100] (darkest to brightest).
    /// - parameter u: The green-red chromaticity component of the color, typically in the range [-100, 100].
    /// - parameter v: The blue-yellow chromaticity component of the color, typically in the range [-100, 100].
    public init(l: Double, u: Double, v: Double) {
        self.init(CIELUV(L: l, u: u, v: v))
    }

    /// The CIELUV components of a color - lightness (L) and chromaticity (u,v).
    public var cieluv: (l: Double, u: Double, v: Double) {
        let cieluv = self.Luv
        return (cieluv.L, cieluv.u, cieluv.v)
    }
}
