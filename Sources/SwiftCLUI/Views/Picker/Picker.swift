//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct Numbered: View {
    
    public let number: Int?
    public let fixedWidht: UInt
    
    public init(number: Int?, fixedWidht: UInt) {
        self.number = number
        self.fixedWidht = fixedWidht
    }
    
    public var body: some View {
        Text("\(number != nil ? "\(number!)" : "")".fixedWidth(fixedWidht))
    }
}

public struct Picker<Element>: View {

    public var id: UUID = UUID(uuidString: "5CF2A3B3-D6C1-47BC-809B-3DB5B1E00305")!

    @State
    internal var selected: Int

    private let elements: [Element]

    @MainActor
    var onSelected: (Element) -> Void
    
    @ViewBuilder
    private let content: (Element, Bool) -> any View
    
    private let numbered: Bool

    public init(
        selected: Int = 0,
        numbered: Bool = false,
        elements: [Element],
        @ViewBuilder
        content: @escaping (Element, Bool) -> any View,
        onSelected: @MainActor @escaping (Element) -> Void
    ) {
        self.numbered = numbered
        self.content = content
        self.selected = selected
        self.elements = elements
        self.onSelected = onSelected
    }

    public var body: some View {
        VStack {
            ForEach(data: elements.enumerated().map { ($0, $1)}) { (index, element) in
                HStack(spacing: 1) {
                    Numbered(number: numbered ? index : nil, fixedWidht: numbered ? 1 : 0)
                    PickerSelectionIndicator(index == selected)
                    content(element, index == selected)
                }
            }
        }.onKeyPressed(id) { event in
            keyPressed(event)
        }
    }
    
    private var keyPressCallbacks = [Character: (Element) -> Void]()
    
    public func onKeyPressed(
        _ event: KeyPressEvent,
        perform callback: @MainActor @escaping (Element) -> Void
    ) -> Self {
        var copy = self
        guard let char = event.key.character else {
            return copy
        }
        copy.keyPressCallbacks[char] = callback
        return copy
    }

    private func keyPressed(_ event: KeyPressEvent) {
        if let character = event.key.character, let callback = keyPressCallbacks[character] {
            callback(elements[selected])
        } else if let integer = event.key.integer, event.modifiers.isEmpty {
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
        set(selected: selected + 1)
    }

    private func previous() {
        set(selected: selected - 1)
    }

    private func set(selected value: Int) {
        let new = min(max(0, value), elements.count - 1)
        if new != selected {
            selected = new
        }
    }
}
