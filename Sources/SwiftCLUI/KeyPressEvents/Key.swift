//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public enum Key: Equatable, CustomStringConvertible {
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

    public var description: String {
        switch self {
        case .char(let char): return String(char)
        case .up: return "up"
        case .down: return "down"
        case .right: return "right"
        case .left: return "left"
        case .end: return "end"
        case .home: return "home"
        case .insert: return "insert"
        case .delete: return "delete"
        case .pageUp: return "pageUp"
        case .pageDown: return "pageDown"
        case .f1: return "f1"
        case .f2: return "f2"
        case .f3: return "f3"
        case .f4: return "f4"
        case .f5: return "f5"
        case .f6: return "f6"
        case .f7: return "f7"
        case .f8: return "f8"
        case .f9: return "f9"
        case .f10: return "f10"
        case .f11: return "f11"
        case .f12: return "f12"
        }
    }
}
