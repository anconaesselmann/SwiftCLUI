//  Created by Axel Esselmann on 3/28/25.
//

import Foundation

public extension View {
    func onAppear(perform action: (() -> Void)? = nil) -> some View {
        action?()
        return self
    }
}
