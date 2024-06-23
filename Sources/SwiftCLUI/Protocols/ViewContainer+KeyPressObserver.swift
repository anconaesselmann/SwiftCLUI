//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public extension ViewContainer where Self: KeyPressObserver {
    public func keyPressed(_ event: KeyPressEvent) -> Bool {
        for element in self.elements {
            if let observer = element as? KeyPressObserver {
                if observer.keyPressed(event) {
                    return true
                }
            }
        }
        return false
    }
}
