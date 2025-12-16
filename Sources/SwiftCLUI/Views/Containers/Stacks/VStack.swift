//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct VStack: View, ObservableViewContainer {

    public let elements: [any View]

    private let spacing: Int

    public var elementsChangedObserver: ElementsObserver

    public init(
        spacing: Int = 1,
        @ViewBuilder
        elements: () -> [any View]
    ) {
        self.init(spacing: spacing, elements())
    }

    public init(spacing: Int = 1, _ elements: [any View]) {
        self.spacing = spacing
        self.elements = elements.flatten()
        elementsChangedObserver = ElementsObserver()
        for view in elements {
            elementsChangedObserver.register(view)
        }
    }

    public var body: some View {
        // TODO: Only works with one-line strings for now
        elements
            .flatMap { ($0 as? Group)?.elements ?? [$0] }
            .filter { type(of: $0) != EmptyView.self }
            .map { $0.string }
            .joined(separator: Array(repeating: "\n", count: spacing).joined())
    }
}
