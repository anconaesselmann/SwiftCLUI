//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation

public struct PickerSelectionIndicator: View {

    private let selected: Bool

    public init(_ selected: Bool) {
        self.selected = selected
    }

    public var body: some View {
        Text(selected
             ? "●".lightGreen
             : "○".foreColor(250)
        )
    }
}
