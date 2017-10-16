import PathKit

class TemplateManager {

    struct TemplateSource {

        let name: String
        let version: String
        let directory: String

        init(source: String) {
            let sourceComponents = source.components(separatedBy: "@")

            name = sourceComponents[0]
            version = sourceComponents.count > 1 ? sourceComponents[1] : "master"
            directory = source.name.replacingOccurrences(of: "/", with: "-")
        }
    }

    let sharedTemplateLocation = Path("/Library/Developer/Xcode/Templates")
    let userTemplateLocation = Path("~/Library/Developer/Xcode/Templates")

    private func parseTemplateSource(templateSource: String) -> TemplateSource {

    }

    func install(templateSources: [String]) {

        for source in templateSources {

            let source = TemplateSource(source: source)

            userTemplateLocation.shell("rm", "-rf", source.directory)
            userTemplateLocation.shell("git", "clone", "-q", "https://github.com/" + source.name + ".git", source.directory, "-b", source.version)
    
            print("Installed \(source.name)")
        }
    }

    func update(templateSources: [String]) {

        for source in templateSources {

            let source = TemplateSource(source: source)

            let directoryPath = userTemplateLocation + Path(source.directory)
            directoryPath.shell("git", "pull")

            print("Updated \(source.name)")
        }
    }

    func uninstall(templateSources: [String]) {

        for source in templateSources {

            let source = TemplateSource(source: source)
            userTemplateLocation.shell("rm", "-rf", source.directory)

            print("Uninstalled \(source.name)")
        }
    }
}