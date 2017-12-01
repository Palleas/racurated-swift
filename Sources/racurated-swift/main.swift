import Foundation
import ReactiveSwift
import class Tentacle.Client
import enum Result.NoError

let w = Website(projects: [
    Project(
        repository: .init(owner: "kickstarter", name: "ios-oss"),
        platform: .iOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "kickstarter", name: "ios-ksapi"),
        platform: .iOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "kickstarter", name: "Kickstarter-ReactiveExtensions"),
        platform: .iOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "evgeniyd", name: "Giraffe"),
        platform: .iOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "richeterre", name: "SwiftGoal"),
        platform: .iOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "palleas", name: "rewatch"),
        platform: .iOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "carthage", name: "carthage"),
        platform: .macOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "thoughtbot", name: "Tropos"),
        platform: .macOS,
        kind: .app
    ),

    Project(
        repository: .init(owner: "mdiep", name: "Tentacle"),
        platform: .iOS,
        kind: .framework
    ),

    Project(
        repository: .init(owner: "MailOnline", name: "Reactor"),
        platform: .iOS,
        kind: .framework
    ),

    Project(
        repository: .init(owner: "jzzocc", name: "crystal-clipboard-ios"),
        platform: .iOS,
        kind: .app
    )
])

let client = Client(.dotCom, token: ProcessInfo.processInfo.environment["GITHUB_TOKEN"]!)

let sema = DispatchSemaphore(value: 0)

let generator = Generator(client: client)
generator
    .generate(w)
    .startWithResult { result in
        defer { sema.signal() }

        switch result {
        case let .success(path):
            print("Successfully generate website at: \(path.path)")
        case let .failure(error):
            print("Unable to generate website: \(error)")
        }
    }

sema.wait()
