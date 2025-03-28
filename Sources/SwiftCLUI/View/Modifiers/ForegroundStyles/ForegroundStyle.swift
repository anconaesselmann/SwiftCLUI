//  Created by Axel Esselmann on 3/27/25.
//

import Foundation

public protocol ForegroundStyle {
    func applied(to content: String) -> String
}
