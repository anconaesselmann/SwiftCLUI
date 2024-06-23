//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct HStack: View, ViewContainer, KeyPressObserver {

    public var id: UUID = UUID()

    public let elements: [any View]

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
}
