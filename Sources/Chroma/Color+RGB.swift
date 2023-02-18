#if canImport(AppKit)
import AppKit
typealias PlatformColor = NSColor
#elseif canImport(UIKit)
import UIKit
typealias PlatformColor = UIColor
#endif

import SwiftUI

extension PlatformColor {
    public convenience init(rgb: RGB, alpha: Double) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: alpha)
    }

    public convenience init(l: Double, c: Double, h: Double, alpha: Double = 1) {
        let rgb = RGB(l: l, c: c, h: h)
        self.init(rgb: rgb, alpha: alpha)
    }

    public convenience init(l: Double, a: Double, b: Double, alpha: Double = 1) {
        let rgb = RGB(l: l, a: a, b: b)
        self.init(rgb: rgb, alpha: alpha)
    }

    public convenience init(l: Double, u: Double, v: Double, alpha: Double = 1) {
        let rgb = RGB(l: l, u: u, v: v)
        self.init(rgb: rgb, alpha: alpha)
    }

    public convenience init(x: Double, y: Double, z: Double, alpha: Double = 1) {
        let rgb = RGB(x: x, y: y, z: z)
        self.init(rgb: rgb, alpha: alpha)
    }

    public var rgb: RGB {
        RGB(
            red: self.redComponent,
            green: self.greenComponent,
            blue: self.blueComponent
        )
    }

    public var hex: String {
        self.rgb.hex
    }

    public convenience init?(hex: String, alpha: Double = 1) {
        guard let rgb = RGB(hex: hex) else {
            return nil
        }

        self.init(rgb: rgb, alpha: alpha)
    }
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
extension Color {
    public init(rgb: RGB, alpha: Double) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, opacity: alpha)
    }

    public init(l: Double, c: Double, h: Double, alpha: Double = 1) {
        let rgb = RGB(l: l, c: c, h: h)
        self.init(rgb: rgb, alpha: alpha)
    }

    public init(l: Double, a: Double, b: Double, alpha: Double = 1) {
        let rgb = RGB(l: l, a: a, b: b)
        self.init(rgb: rgb, alpha: alpha)
    }

    public init(l: Double, u: Double, v: Double, alpha: Double = 1) {
        let rgb = RGB(l: l, u: u, v: v)
        self.init(rgb: rgb, alpha: alpha)
    }

    public init(x: Double, y: Double, z: Double, alpha: Double = 1) {
        let rgb = RGB(x: x, y: y, z: z)
        self.init(rgb: rgb, alpha: alpha)
    }

    public init?(hex: String, alpha: Double = 1) {
        guard let rgb = RGB(hex: hex) else {
            return nil
        }

        self.init(rgb: rgb, alpha: alpha)
    }
}
