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
    
    func foreground(_ style: ForegroundStyle) -> some View {
        style.applied(to: string)
    }
    
    func frame(width: Int) -> some View {
        self.string.fixedWidth(UInt(width))
    }
}

internal struct BackgroundView<V>: View where V: View {
    let color: Color
    let body: V

    var string: String {
        body.string.backColor(color.value)
    }
}
