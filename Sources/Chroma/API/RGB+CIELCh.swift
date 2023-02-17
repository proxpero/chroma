extension RGB {
    /// Initializes a color from CIELCh°(ab) components.
    /// - parameter l: The lightness component of the color, in the range [0, 100] (darkest to brightest).
    /// - parameter c: The chroma component of the color.
    /// - parameter h: The hue component of the color, in the range [0, 360°].
    public init(l: Double, c: Double, h: Double) {
        self.init(ab: CIELCh(L: l, C: c, h: h))
    }

    /// The CIELCh°(ab) components of the color using a d65 illuminant and 2° standard observer.
    public var cielch: (l: Double, c: Double, h: Double) {
        let result = self.LCh_ab
        return (result.L, result.C, result.h)
    }
}
