//  Created by Axel Ancona Esselmann on 6/24/24.
//

import Foundation
import ANSITerminal

public extension View {
    func background(_ color: Color) -> some View {
        BackgroundView(color: color, body: self)
    }
    
    func foregroundColor(_ color: Color) -> some View {
        self.string.foreColor(color.value)
    }
}

internal struct BackgroundView<V>: View where V: View {
    let color: Color
    let body: V

    var string: String {
        body.string.backColor(color.value)
    }
}
