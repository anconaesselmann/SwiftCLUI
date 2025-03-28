//  Created by Axel Esselmann on 3/28/25.
//

import Foundation

public extension String {
    func fixedWidth(_ width: UInt) -> String {
        let currentWidth = self.count
        if currentWidth < width {
            let padding = Array(repeating: " ", count: Int(width) - currentWidth).joined()
            return self + padding
        } else {
            return String(self.map { $0 }[0..<Int(width)])
        }
    }
}
