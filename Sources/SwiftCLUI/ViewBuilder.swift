//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

@resultBuilder
public struct ViewBuilder {
    static func buildBlock() -> some View { EmptyView() }
}

public extension ViewBuilder {
    static func buildBlock<V1>(_ v1: V1) -> some View
        where V1: View
    {
        v1
    }
    static func buildBlock<V1, V2>(
        _ v1: V1,
        _ v2: V2
    ) -> [any View]
        where
            V1: View,
            V2: View
    {
        [v1, v2]
    }

    static func buildBlock(_ views: (any View)...) -> [any View] {
        views
    }
}
