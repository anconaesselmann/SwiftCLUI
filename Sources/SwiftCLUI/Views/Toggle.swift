//  Created by Axel Ancona Esselmann on 6/24/24.
//

import Foundation

public struct Toggle: View {

    public var id: UUID = UUID(uuidString: "1EE203AE-F6AB-4DF9-9C84-F596365FEA29")!

    @State
    internal var selected: Bool

    private let onChange: (Bool) -> Void

    public init(_ selected: Bool = false, onChange: @escaping (Bool) -> Void) {
        self.selected = selected
        self.onChange = onChange
    }

    public var body: some View {
        Text(selected
             ? "-".foreColor(250) + "●".lightGreen
             : "○-".foreColor(250)
        ).onKeyPressed(id) { event in
            keyPressed(event)
        }
    }

    public func keyPressed(_ event: KeyPressEvent) {
        if event.key == .left {
            selected = false
        } else if event.key == .right {
            selected = true
        }
        onChange(selected)
    }
}
