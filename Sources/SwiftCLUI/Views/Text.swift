//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation

public struct Text: View {

    private let content: String

    public init(_ content: String) {
        self.content = content
    }

    public var body: some View {
        content
    }
}
