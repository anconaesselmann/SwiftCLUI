//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct Picker: View, KeyPressObserver {

    @State
    internal var selected: Int

    private let elements: [String]

    public init(selected: Int = 0, elements: [String]) { 
        self.selected = selected
        self.elements = elements
    }

    public var body: some View {
        VStack {
            ForEach(data: elements.enumerated().map { ($0, $1)}) { (index, element) in
                HStack(spacing: 1) {
                    PickerSelectionIndicator(index == selected)
                    Text(element)
                }
            }
        }
    }

    public func keyPressed(_ event: KeyPressEvent) -> Bool {
        if let integer = event.key.integer, event.modifiers.isEmpty {
            set(selected: integer)
        } else if event.key == .up {
            previous()
        } else if event.key == .down {
            next()
        } else if
            let npc = event.key.nonPrintableCharacter,
            npc == .enter
        {
            return true
        }
        return false
    }

    private func next() {
        selected = min(elements.count - 1, selected + 1)
    }

    private func previous() {
        selected = max(0, selected - 1)
    }

    private func set(selected value: Int) {
        selected = min(max(0, value), elements.count - 1)
    }
}
