//  Created by Axel Ancona Esselmann on 6/24/24.
//

import Foundation
import Ansi256Color

public struct Color {
    public static let red = Color(Ansi256Color.red.value)
    public static let green = Color(Ansi256Color.green.value)
    public static let yellow = Color(Ansi256Color.yellow.value)
    public static let blue = Color(Ansi256Color.blue.value)
    public static let magenta = Color(Ansi256Color.magenta.value)
    public static let cyan = Color(Ansi256Color.cyan.value)
    public static let white = Color(Ansi256Color.white.value)
    public static let brown = Color(Ansi256Color.brown.value)
    public static let orange = Color(Ansi256Color.orange.value)
    public static let purple = Color(Ansi256Color.purple.value)
    public static let lightGray = Color(Ansi256Color.lightGray.value)
    public static let gray = Color(Ansi256Color.gray.value)
    public static let darkGray = Color(Ansi256Color.darkGray.value)

    public var value: UInt8

    public init(_ ansi: UInt8) {
        self.value = ansi
    }

    public init(r: UInt8, g: UInt8, b: UInt8) {
        self.value = Ansi256Color(r: r, g: g, b: b).value
    }

    public init(red: Double, green: Double, blue: Double) {
        self.value = Ansi256Color(red: red, green: green, blue: blue).value
    }
}
