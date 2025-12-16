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
        signal(SIGINT, SIG_IGN)
        let environemnt = Environment.shared
        cursorOff()
        let restoreCursor = readCursorPos().row
        clearScreen()
        let startingLine = readCursorPos().row // + 1
        var bag: Set<AnyCancellable> = []
        var body: (any View) = body
        if (body as? ObservableViewContainer) == nil {
            body = VStack {
                body
            }
        }
        bag += body.bind(to: environemnt.objectWillChange)
        environemnt.appState.sink {
            let (shouldExit, exitValue) = $0.exitValues
            if shouldExit {
                exit(exitValue, cursorPositon: restoreCursor)
            }
        }.store(in: &bag)
        environemnt.objectWillChange.sink {
            moveTo(startingLine, 0)
            write(body.string)
        }
        .store(in: &bag)
        moveTo(startingLine, 0)
        write(body.string)
        repeat {
            do {
                clearBuffer()
                if keyPressed() {
                    processKeyPress()
                }
                try await Task.sleep(500_000)
            } catch {
                break
            }
        } while environemnt.appState.value.isRunning
        return bag
    }
    
    private func processKeyPress() {
        let environment = Environment.shared
        let char = readChar()
        let key = readKey()
//        print(char, key.code, key.meta)
        let event = KeyPressEvent(char: char, ansiKeyCode: key)
        environment.keyPressEvent.send(event)
    }
    
    private func exit(_ exitValue: String?, cursorPositon: Int) {
//        if let exitValue {
//            moveTo(cursorPositon - 1, 0)
//            write(exitValue)
//        }
//        moveTo(cursorPositon, 0)
//        moveTo(startingLine, 0)
        write("\n")
        if let exitValue {
//            write("\n" + exitValue)
            print(exitValue)
        }
        moveTo(readCursorPos().row, 0)
        cursorOn()
    }

    public static func main() async {
        await Self().run()
    }
}
