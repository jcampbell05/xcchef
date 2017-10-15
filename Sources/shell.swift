import Foundation
import PathKit

extension Path {
    @discardableResult
    func shell(_ args: String...) -> Int32 {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.currentDirectoryPath = string

        task.launch()
        task.waitUntilExit()
        return task.terminationStatus
    }
}
