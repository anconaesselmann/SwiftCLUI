//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import Combine

public class ElementsObserver: SwiftCLUIState {

    public var objectWillChange = PassthroughSubject<Void, Never>()

    private var bag = Set<AnyCancellable>()

    public init() {
        
    }

    public func register(_ view: some View) {
        Mirror(reflecting: view).children.forEach { child in
            if let state = (child.value as? (any SwiftCLUIState)) {
                state.objectWillChange.sink { [weak self] in
                    self?.objectWillChange.send(())
                }.store(in: &bag)
            }
        }
    }
}
