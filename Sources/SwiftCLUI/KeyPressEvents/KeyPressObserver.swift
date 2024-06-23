//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public protocol KeyPressObserver {
    func keyPressed(_ event: KeyPressEvent) -> Bool
}
