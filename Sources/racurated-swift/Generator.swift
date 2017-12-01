import Foundation
import ReactiveSwift
import Stencil
import Result
import Tentacle
import Files

struct Generator {

    enum GenerationError: Error {
        case githubError(Client.Error)
        case writeError(Error)
    }

    private let environment: Environment
    private let client: Client
    init(client: Client) {
        self.client = client
        self.environment = Environment(
            loader: DictionaryLoader(
                templates: [
                    "head.html": Templates.head,
                    "header.html": Templates.header,
                    "footer.html": Templates.footer,
                    "projects.html": Templates.projects,
                    "project.html": Templates.project
                ]
            )
        )

    }

    func fetch(project: Project) -> SignalProducer<ProjectDescription, GenerationError> {
        return client.execute(project.repository.info)
            .map {
                let info = $0.1

                return ProjectDescription(
                    name: info.name,
                    fullname: info.nameWithOwner,
                    description: info.body ?? "",
                    url: info.url,
                    project: project
                )
            }
            .mapError { .githubError($0) }
    }

    func render(projects: [ProjectDescription]) -> Result<String, GenerationError> {
        return Result {
            return try self.environment.renderTemplate(
                name: "projects.html",
                context: ["projects": projects]
            )
        }
    }

    func write(to path: String, content: String) -> Result<Files.File, GenerationError> {
        return Result {
            let target = try Folder(path: path).createSubfolderIfNeeded(withName: "build")
            return try target.createFile(named: "index.html", contents: content)
        }
    }

    func generate(_ website: Website) -> SignalProducer<Files.File, GenerationError> {
        return SignalProducer(website.projects)
            .flatMap(.concat, self.fetch)
            .collect()
            .attemptMap(self.render)
            .attemptMap { content in
                return self.write(
                    to: FileManager.default.currentDirectoryPath,
                    content: content
                )
            }
    }
}
