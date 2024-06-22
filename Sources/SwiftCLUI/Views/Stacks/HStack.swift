//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct HStack: View {

    public var id: UUID = UUID()

    private let elements: [any View]

    private let spacing: Int

    private var elementsChangedObserver: ElementsObserver

    public init(spacing: Int = 1, _ elements: [any View]) {
        self.spacing = spacing
        self.elements = elements
        elementsChangedObserver = ElementsObserver()
        for view in elements {
            elementsChangedObserver.register(view)
        }
    }

    public var body: some View {
        // TODO: Only works with one-line strings for now
        elements
            .map { $0.string }
            .joined(separator: Array(repeating: " ", count: spacing).joined())
    }

    public var string: String {
        body.string
    }
}

import ANSITerminal

extension HStack: KeyPressObserver {
    
    public func keyPressed(char: Character, key: (code: ANSITerminal.ANSIKeyCode, meta: [ANSITerminal.ANSIMetaCode])) -> Bool {
        for element in self.elements {
            if let observer = element as? KeyPressObserver {
                if observer.keyPressed(char: char, key: key) {
                    return true
                }
            }
        }
        return false
    }
}
