//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

@MainActor
public protocol NoneDrawingContainer: ViewContainer { }

public extension NoneDrawingContainer where Self: View {
    var body: some View {
        assertionFailure("Container should consume elements")
        return EmptyView()
    }
}
