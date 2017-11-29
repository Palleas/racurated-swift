struct Version {
    let rawValue: String
}

struct Project {
    enum Kind {
        case tool
        case framework
        case app
    }

    enum Platform {
        case iOS
        case macOS
        case other
    }

    let name: String
    let description: String
    let version: Version
    let highlights: Set<String>
    let repository: URL
    let platform: Platform
    let kind: Kind
}
