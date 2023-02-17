extension RGB {
    /// /// Initializes an RGB from CIELAB components.
    /// - parameter l: The lightness component of the color, in the range [0, 100] (darkest to brightest).
    /// - parameter a: The green-red chromaticity component of the color, typically in the range [-128, 128].
    /// - parameter b: The blue-yellow chromaticity component of the color, typically in the range [-128, 128].
    public init(l: Double, a: Double, b: Double) {
        self.init(CIELAB(L: l, a: a, b: b))
    }

    /// The CIELAB components of a color - lightness (L) and chromaticity (a,b).
    public var cielab: (l: Double, a: Double, b: Double) {
        let cielab = self.Lab
        return (cielab.L, cielab.a, cielab.b)
    }
}
