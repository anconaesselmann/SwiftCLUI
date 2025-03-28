//  Created by Axel Esselmann on 3/27/25.
//

import Foundation

public struct NoForegroundStyle: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content
    }
}

public struct Normal: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.normal
    }
}

public struct Strike: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.strike
    }
}
public struct Bold: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.bold
    }
}
public struct Dim: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.dim
    }
}
public struct Italic: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.italic
    }
}
public struct Underline: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.underline
    }
}
public struct blink: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.blink
    }
}
public struct Overline: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.overline
    }
}
public struct Inverse: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.inverse
    }
}
public struct Hidden: ForegroundStyle {
    public init() { }
    
    public func applied(to content: String) -> String {
        content.hidden
    }
}
