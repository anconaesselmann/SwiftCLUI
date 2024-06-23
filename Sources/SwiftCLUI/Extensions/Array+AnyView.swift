//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

extension Array where Element == any View {
    func flatten() -> Self {
        self.flatMap { view in
            if let views = (view as? ForEach)?.elements {
                return views
            } else {
                return [view]
            }
        }
    }
}
