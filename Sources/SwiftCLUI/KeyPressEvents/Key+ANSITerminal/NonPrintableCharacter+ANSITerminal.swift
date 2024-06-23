//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import ANSITerminal

public extension NonPrintableCharacter {
    init?(_ character: Character) {
        guard let npc = NonPrintableChar(rawValue: character) else {
            return nil
        }
        switch npc {
        case .none:
            return nil
        case .bell:
            self = .bell
        case .erase:
            self = .erase
        case .tab:
            self = .tab
        case .linefeed:
            self = .linefeed
        case .vtab:
            self = .vtab
        case .formfeed:
            self = .formfeed
        case .enter:
            self = .enter
        case .endOfLine:
            self = .endOfLine
        case .escape:
            self = .escape
        case .space:
            self = .space
        case .del:
            self = .del
        }
    }
}
