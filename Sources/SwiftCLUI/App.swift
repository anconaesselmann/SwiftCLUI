//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import ANSITerminal
import Combine

@MainActor
public protocol App: View {

    associatedtype Content
        where Content: View

    @ViewBuilder
    var body: Content { get }

    static func main() async

    init()
}

public extension App {
    @discardableResult
    func run() async -> Set<AnyCancellable> {
        cursorOff()
        let restoreCursor = readCursorPos().row
        clearScreen()
        let startingLine = readCursorPos().row
        let shouldUpdate = PassthroughSubject<Void, Never>()
        var bag: Set<AnyCancellable> = []
        var body: (any View) = body
        if (body as? ObservableViewContainer) == nil {
            body = VStack {
                body
            }
        }
        bag += body.bind(to: shouldUpdate)
        shouldUpdate.sink {
            moveTo(startingLine + 1, 0)
            write(body.string)
        }
        .store(in: &bag)
        moveTo(startingLine + 1, 0)
        write(body.string)
        repeat {
            do {
                clearBuffer()
                if keyPressed() {
                    let (shouldExit, exitValue) = processKeyPress()
                    if shouldExit {
                        exit(exitValue, cursorPositon: restoreCursor)
                        return bag
                    }
                }
                try await Task.sleep(500_000)
            } catch {
                break
            }
        } while Environment.shared.appState.value.isRunning
        return bag
    }
    
    private func processKeyPress() -> (shouldExit: Bool, value: String?) {
        let environment = Environment.shared
        let char = readChar()
        let key = readKey()
        let event = KeyPressEvent(char: char, ansiKeyCode: key)
        environment.keyPressEvent.send(event)
        return environment.appState.value.exitValues
    }
    
    private func exit(_ exitValue: String?, cursorPositon: Int) {
        if let exitValue {
            moveTo(cursorPositon - 1, 0)
            write(exitValue)
        }
        moveTo(cursorPositon, 0)
        cursorOn()
    }

    public static func main() async {
        await Self().run()
    }
}
