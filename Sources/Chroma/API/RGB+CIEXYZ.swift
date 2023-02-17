extension RGB {
    /// Initialize an RGB with the CIE 1931 XYZ components of a color.
    /// - parameter x: A mix of cone response curves chosen to be orthogonal to luminance and non-negative, in the range [0, 95.047].
    /// - parameter y: The luminance component of the color, in the range [0, 100].
    /// - parameter z: Somewhat equal to blue, or the "S" cone response, in the range [0, 108.883].
    public init(x: Double, y: Double, z: Double) {
        let x = max(0, min(95.047, x))
        let y = max(0, min(100.000, y))
        let z = max(0, min(108.883, z))
        self.init(CIEXYZ(X: x, Y: y, Z: z))
    }

    /// The CIE 1931 XYZ components of the color.
    public var ciexyz: (x: Double, y: Double, z: Double) {
        let ciexyz = self.XYZ
        return (ciexyz.X, ciexyz.Y, ciexyz.Z)
    }
}
