//  Created by Axel Ancona Esselmann on 6/24/24.
//

import Foundation
import Ansi256Color

struct Color {
    static let green = Color(value: Ansi256Color.green.value)

    let value: UInt8
}
