//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import ANSITerminal
import Combine

public protocol App {

    @ViewBuilder
    var body: VStack { get }

    func run()
}

public extension App {
    func run() {
        cursorOff()
        let restoreCursor = readCursorPos().row
        clearScreen()
        let startingLine = readCursorPos().row
        var bag: AnyCancellable? = body.elementsChangedObserver.objectWillChange
            .sink {
                self.draw(startingLine)
            }
        draw(startingLine)
        while true {
            clearBuffer()
            if keyPressed() {
                let char = readChar()
                let key = readKey()
                let event = KeyPressEvent(char: char, ansiKeyCode: key)
                if body.keyPressed(event) {
                    moveTo(restoreCursor - 1, 0)
                    return
                }
            }
        }
    }

    private func draw(_ startingLine: Int) {
        moveTo(startingLine + 1, 0)
        write(body.string)
    }
}
