import Guaka

let version = "0.1"
let versionCommand = Command(usage: "version", run: execute)

private func execute(flags: Flags, args: [String]) {
  print(version)
}
