//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import Combine

@propertyWrapper 
public class State<T>: SwiftCLUIState {

    public var objectWillChange = PassthroughSubject<Void, Never>()

    public var wrappedValue: T {
        didSet {
            objectWillChange.send()
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}
