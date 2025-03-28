//  Created by Axel Esselmann on 3/27/25.
//

import Foundation

public struct Strike: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.strike
    }
}
