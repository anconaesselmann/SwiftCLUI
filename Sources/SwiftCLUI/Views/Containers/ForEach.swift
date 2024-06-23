//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

public struct ForEach: View, NoneDrawingContainer {
    public let elements: [any View]

    public init<Element>(
        data: [Element],
        @ViewBuilder
        content: (Element) -> any View
    ) {
        self.elements = data.map { content($0) }
    }
}
