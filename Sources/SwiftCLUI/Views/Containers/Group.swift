//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

public struct Group: View, NoneDrawingContainer {
    public let elements: [any View]
    
    internal init(elements: [any View]) {
        self.elements = elements
    }

    public init(
        @ViewBuilder
        content: () -> [any View]
    ) {
        self.elements = content()
    }
}
