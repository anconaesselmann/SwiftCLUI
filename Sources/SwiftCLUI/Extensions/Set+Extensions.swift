//  Created by Axel Ancona Esselmann on 6/24/24.
//

import Foundation

extension Set {
    static func +=(lhs: inout Self, rhs: Self) {
        lhs = lhs.union(rhs)
    }
}
