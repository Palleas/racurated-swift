import Tentacle
import Foundation

struct Project {
    enum Kind: String {
        case tool
        case framework
        case app
    }

    enum Platform: String {
        case iOS
        case macOS
        case other
    }

    let repository: Repository
    let platform: Platform
    let kind: Kind
}

struct ProjectDescription {
    let name: String
    let fullname: String
    let description: String
    let url: URL
    let platform: Project.Platform
    let kind: Project.Kind

    init(name: String, fullname: String, description: String, url: URL, project: Project) {
        self.name = name
        self.fullname = fullname
        self.description = description
        self.url = url
        self.platform = project.platform
        self.kind = project.kind
    }
}
