//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public enum Key: Equatable {
    case char(Character), up, down, right, left, end, home, insert, delete, pageUp, pageDown, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12

    public var character: Character? {
        if case let .char(character) = self {
            return character
        } else {
            return nil
        }
    }

    public var integer: Int? {
        guard let character = character else {
            return nil
        }
        return Int(String(character))
    }

    public var nonPrintableCharacter: NonPrintableCharacter? {
        guard 
            let character = character
        else {
            return nil
        }
        return NonPrintableCharacter(character)
    }
}
