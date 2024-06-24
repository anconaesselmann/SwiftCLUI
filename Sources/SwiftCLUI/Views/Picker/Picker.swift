//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct Picker: View {

    public var id: UUID = UUID()
    
    @State
    internal var selected: Int

    private let elements: [String]

    var onSelected: (String) -> Void

    public init(selected: Int = 0, elements: [String], onSelected: @escaping (String) -> Void) {
        self.selected = selected
        self.elements = elements
        self.onSelected = onSelected
    }

    public var body: some View {
        VStack {
            ForEach(data: elements.enumerated().map { ($0, $1)}) { (index, element) in
                HStack(spacing: 1) {
                    PickerSelectionIndicator(index == selected)
                    Text(element)
                }
                .background(.green)
            }
        }.onKeyPressed(id) { event in
            keyPressed(event)
        }
    }

    public func keyPressed(_ event: KeyPressEvent) {
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
            onSelected(elements[selected])
        }
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
