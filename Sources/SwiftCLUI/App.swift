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
        var bag: Set<AnyCancellable> = []
        withExtendedLifetime(bag) {
            var body: (any View) = body
            if (body as? ObservableViewContainer) == nil {
                body = VStack {
                    body
                }
            }
            if let container = body as? ObservableViewContainer {
                let subscription = container.elementsChangedObserver.objectWillChange
                    .sink {
                        moveTo(startingLine + 1, 0)
                        write(body.string)
                    }
                    .store(in: &bag)
            }
            moveTo(startingLine + 1, 0)
            write(body.string)
            while true {
                clearBuffer()
                if keyPressed() {
                    let char = readChar()
                    let key = readKey()
                    let event = KeyPressEvent(char: char, ansiKeyCode: key)
                    Environment.shared.keyPressEvent.send(event)
                    let (shouldExit, value) = processAppState()
                    if shouldExit {
                        if let value {
                            moveTo(restoreCursor - 1, 0)
                            write(value)
                        }
                        moveTo(restoreCursor, 0)
                        return
                    }
                }
            }
        }
    }

    private func processAppState() -> (shouldExit: Bool, value: String?) {
        switch Environment.shared.appState.value {
        case .success(let state):
            switch state {
            case .value(let value):
                return (true, value)
            case .success:
                return (true, nil)
            case .running: ()
            }
        case .failure(let error):
            return (true, nil)
        }
        return (false, nil)
    }

    public static func main() async {
        await Self().run()
    }
}
