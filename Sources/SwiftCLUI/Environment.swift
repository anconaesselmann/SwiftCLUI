//  Created by Axel Ancona Esselmann on 6/23/24.
//

import Foundation
import Combine

public class Environment {

    public enum AppEvent {
        case success, running, value(String)
        
        var isRunning: Bool {
            switch self {
            case .running: return true
            case .success: return false
            case .value: return false
            }
        }
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


extension Result where Success == Environment.AppEvent {
    var isRunning: Bool {
        switch self {
        case .success(let event): return event.isRunning
        case .failure: return false
        }
    }
}
