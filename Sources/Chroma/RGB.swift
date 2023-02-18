public struct RGB {
    /// The red component of the color: [0, 1]
    public let red: Double
    /// The green component of the color: [0, 1]
    public let green: Double
    /// The blue component of the color: [0, 1]
    public let blue: Double

    /// Initializes an RGB with red, green, and blue values
    ///
    /// - parameter red: The red component [0, 1].
    /// - parameter green: The green component [0, 1].
    /// - parameter blue: The blue component [0, 1].
    public init(
        red: Double,
        green: Double,
        blue: Double
    ) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}
