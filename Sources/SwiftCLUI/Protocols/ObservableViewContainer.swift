//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

public protocol ObservableViewContainer: ViewContainer {
    var elementsChangedObserver: ElementsObserver { get }
}
