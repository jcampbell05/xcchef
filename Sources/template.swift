import PathKit

class TemplateManager {

    let sharedTemplateLocation = Path("/Library/Developer/Xcode/Templates")
    let userTemplateLocation = Path("~/Library/Developer/Xcode/Templates")

    func install(templateSources: [String]) {

        for source in templateSources {

            let sourceComponents = source.components(separatedBy: "@")
            let name = sourceComponents[0]
            let version = sourceComponents.count > 1 ? sourceComponents[1] : "master"
            let directory = name.replacingOccurrences(of: "/", with: "-")

            userTemplateLocation.shell("rm", "-rf", directory)
            userTemplateLocation.shell("git", "clone", "-q", "https://github.com/" + name + ".git", directory, "-b", version)
    
            print("Installed \(name)")
        }
    }

    func update(templateSources: [String]) {

        for source in templateSources {

            let sourceComponents = source.components(separatedBy: "@")
            let name = sourceComponents[0]
            let directory = name.replacingOccurrences(of: "/", with: "-")
            let directoryPath = userTemplateLocation + Path(directory)

            directoryPath.shell("git", "pull")

            print("Updated \(name)")
        }
    }

    func uninstall(templateSources: [String]) {

        for source in templateSources {

            let sourceComponents = source.components(separatedBy: "@")
            let name = sourceComponents[0]
            let directory = name.replacingOccurrences(of: "/", with: "-")

            userTemplateLocation.shell("rm", "-rf", directory)

            print("Uninstalled \(name)")
        }
    }
}