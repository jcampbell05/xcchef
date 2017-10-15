import Foundation
import PathKit

class TemplateManager {

    let sharedTemplateLocation = Path("/Library/Developer/Xcode/Templates")
    let userTemplateLocation = Path("~/Library/Developer/Xcode/Templates")
    let templateSourcePattern = try! NSRegularExpression(pattern: "([\\w\\.\\-\\_]+\\/[\\w\\.\\-\\_]+)(\\@[\\w\\.\\-\\_]+)*")
    
    func install(templateSources: [String]) {

        for source in sourceComponents {

            let matches = templateSourcePattern.matches(in: source, options: [], range: NSRange(location: 0, length: source.utf16.count))

            if matches.count > 0  {
                let sourceComponents = source.components(separatedBy: "@")
                let name = sourceComponents[0]
                let version = sourceComponents.count > 1 ? sourceComponents[1] : "master"
                let directory = name

                userTemplateLocation.shell("rm", "-rf", directory)
                userTemplateLocation.shell("git", "clone", "-q", "https://github.com/" + name + ".git", directory, "-b", version)
        
                print("Installed \(name)")
            
            } else {
                fatalError("Invalid template source provided")
            }
        }
    }

    func update(templateSources: [String]) {

        for source in sourceComponents {

            let matches = templateSourcePattern.matches(in: source, options: [], range: NSRange(location: 0, length: source.utf16.count))

            if matches.count > 0  {
                let sourceComponents = source.components(separatedBy: "@")
                let name = sourceComponents[0]
                let directory = name
                let directoryPath = userTemplateLocation + Path(directory)

                directoryPath.shell("git", "pull")

                print("Updated \(name)")
            
            } else {
                fatalError("Invalid template source provided")
            }
        }
    }

    func uninstall(templateSources: [String]) {

        for source in sourceComponents {

            let matches = templateSourcePattern.matches(in: source, options: [], range: NSRange(location: 0, length: source.utf16.count))

            if matches.count > 0  {
                let sourceComponents = source.components(separatedBy: "@")
                let name = sourceComponents[0]
                let directory = name

                userTemplateLocation.shell("rm", "-rf", directory)

                print("Uninstalled \(name)")
            
            } else {
                fatalError("Invalid template source provided")
            }
        }
    }
}