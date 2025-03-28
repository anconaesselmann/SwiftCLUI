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
        
        var exitValues: (shouldExit: Bool, value: String?) {
            switch self {
            case .value(let value):
                return (true, value)
            case .success:
                return (true, nil)
            case .running:
                return (false, nil)
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
    
    var exitValues: (shouldExit: Bool, value: String?) {
        switch self {
        case .success(let state):
            return state.exitValues
        case .failure:
            return (true, nil)
        }
    }
}
