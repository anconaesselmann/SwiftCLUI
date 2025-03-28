//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

@MainActor
public protocol View {
    associatedtype V
        where V: View

    @ViewBuilder
    var body: V { get }

    var string: String { get }

    var width: Int { get }
    var height: Int { get }
}

public extension View {
    var height: Int {
        string.split(separator: "\n").count
    }

    var width: Int {
        string.split(separator: "\n")
            .reduce(into: 0) {
                if $1.count > $0 {
                    $0 = $1.count
                }
            }
    }
    
    var string: String {
        body.string
    }
}
