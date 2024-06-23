//  Created by Axel Ancona Esselmann on 6/22/24.
//

import Foundation
import ANSITerminal
import Combine

public class App {

    private var restoreCursor: Int = 0
    private var startingLine: Int = 0

    private var lines: [UUID: Int] = [:]

    private let elementsChangedObserver: ElementsObserver = ElementsObserver()

    private var bag: AnyCancellable?

    public var body: VStack

    public init(_ body: VStack) {
        self.body = body
    }

    private func draw() {
        moveTo(startingLine + 1, 0)
        write(body.string)
    }

    public func run() {
        cursorOff()
        restoreCursor = readCursorPos().row
        clearScreen()
        startingLine = readCursorPos().row
        bag = body.elementsChangedObserver.objectWillChange
            .sink { [weak self] in
                self?.draw()
            }
        draw()
        while true {
            clearBuffer()
            if keyPressed() {
                let char = readChar()
                let key = readKey()
                let event = KeyPressEvent(char: char, ansiKeyCode: key)
                if body.keyPressed(event) {
                    stop()
                    return
                }
            }
        }
    }

    private func stop() {
        moveTo(restoreCursor - 1, 0)
    }
}
