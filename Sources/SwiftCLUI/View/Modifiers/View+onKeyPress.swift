//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

extension View {
    func onKeyPressed(_ id: UUID, _ callback: @escaping (KeyPressEvent) -> Void) -> some View {
        Subscriptions.shared.values[id] = Environment.shared.keyPressEvent.sink { event in
            callback(event)
        }
        return KeyPressObserverView(body: self)
    }
}

internal struct KeyPressObserverView<V>: View where V: View {
    let body: V
}
