import Foundation
import ReactiveSwift
import class Tentacle.Client
import enum Result.NoError

let w = Website(projects: [
    Project(
        repository: .init(owner: "kickstarter", name: "ios-oss"),
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
