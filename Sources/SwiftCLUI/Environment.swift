//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation
import Combine

public class Environment {

    public enum AppEvent {
        case success, running, value(String)
    }

    private init() {}

    public static let shared = Environment()

    public let keyPressEvent = PassthroughSubject<KeyPressEvent, Never>()

    public let appState = CurrentValueSubject<Result<AppEvent, Error>, Never>(.success(.running))
}

internal class Subscriptions {
    static let shared = Subscriptions()

    var values: [UUID: AnyCancellable] = [:]
}
