import Foundation
import PathKit

class TemplateManager {

    let sharedTemplateLocation = Path("/Library/Developer/Xcode/Templates")
    let userTemplateLocation = Path("~/Library/Developer/Xcode/Templates")
    
    func install(templateLocations: [String]) {

        for location in templateLocations {

            let regex = try! NSRegularExpression(pattern: "([\\w\\.\\-\\_]+\\/[\\w\\.\\-\\_]+)(\\@[\\w\\.\\-\\_]+)*")
            let matches = regex.matches(in: location, options: [], range: NSRange(location: 0, length: location.utf16.count))

            if matches.count > 0  {
                let locationComponents = location.components(separatedBy: "@")
                let name = locationComponents[0]
                let version = locationComponents.count > 1 ? locationComponents[1] : "master"

                userTemplateLocation.shell("git", "clone", "-q", "https://github.com/" + name + ".git", "-b", version)
                print("Installed \(name)")
            } else {
                fatalError("Invalid template source provided")
            }
        }
    }
}