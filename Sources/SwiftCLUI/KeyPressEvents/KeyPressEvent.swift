//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct KeyPressEvent {
    public var key: Key
    public var modifiers: [ModifierKey]

    public init(key: Key, modifiers: [ModifierKey]) {
        self.key = key
        self.modifiers = modifiers
    }
}
