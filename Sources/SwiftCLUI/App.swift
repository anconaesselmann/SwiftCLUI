//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import ANSITerminal
import Combine

public protocol App {

    associatedtype Content
        where Content: View

    @ViewBuilder
    var body: Content { get }

    static func main() async

    init()
}

public extension App {
    func run() async {
        cursorOff()
        let restoreCursor = readCursorPos().row
        clearScreen()
        let startingLine = readCursorPos().row
        var bag: AnyCancellable?
        var body: (any View) = body
        if (body as? ObservableViewContainer) == nil {
            body = VStack {
                body
            }
        }
        if let container = body as? ObservableViewContainer {
            bag = container.elementsChangedObserver.objectWillChange
                .sink {
                    moveTo(startingLine + 1, 0)
                    write(body.string)
                }
        }
        moveTo(startingLine + 1, 0)
        write(body.string)
        while true {
            clearBuffer()
            if keyPressed() {
                let char = readChar()
                let key = readKey()
                let event = KeyPressEvent(char: char, ansiKeyCode: key)
                if let keyObserving = body as? KeyPressObserver {
                    if keyObserving.keyPressed(event) {
                        moveTo(restoreCursor - 1, 0)
                        return
                    }
                }
            }
        }
    }

    public static func main() async {
        await Self().run()
    }
}
