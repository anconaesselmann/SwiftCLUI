//  Created by Axel Ancona Esselmann on 6/24/24.
//

import Foundation
import Combine

extension View {
    func bind(
        to subject: any Subject<Void, Never>
    ) -> Set<AnyCancellable> {
        var bag = Set<AnyCancellable>()
        Mirror(reflecting: self).children.forEach { child in
            if let state = (child.value as? (any SwiftCLUIState)) {
                state.objectWillChange.sink {
                    subject.send(())
                }.store(in: &bag)
            }
        }
        return bag
    }
}
