//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import ANSITerminal

extension KeyPressEvent {
    init(
        char: Character,
        ansiKeyCode: (code: ANSITerminal.ANSIKeyCode, meta: [ANSITerminal.ANSIMetaCode])
    ) {
        modifiers = ansiKeyCode.meta.map {
            switch $0 {
            case .control:
                return .control
            case .shift:
                return .shift
            case .alt:
                return .alt
            }
        }
        switch ansiKeyCode.code {
        case .none:
            key = .char(char)
        case .up:
            key = .up
        case .down:
            key = .down
        case .right:
            key = .right
        case .left:
            key = .left
        case .end:
            key = .end
        case .home:
            key = .home
        case .insert:
            key = .insert
        case .delete:
            key = .delete
        case .pageUp:
            key = .pageUp
        case .pageDown:
            key = .pageDown
        case .f1:
            key = .f1
        case .f2:
            key = .f2
        case .f3:
            key = .f3
        case .f4:
            key = .f4
        case .f5:
            key = .f5
        case .f6:
            key = .f6
        case .f7:
            key = .f7
        case .f8:
            key = .f8
        case .f9:
            key = .f9
        case .f10:
            key = .f10
        case .f11:
            key = .f11
        case .f12:
            key = .f12
        }

    }
}
