//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

struct Group<Element>: View, NoneDrawingContainer
    where Element: View
{
    public let elements: [any View]

    public init(
        @ViewBuilder
        content: () -> [any View]
    ) {
        self.elements = content()
    }
}
