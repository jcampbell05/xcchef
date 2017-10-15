import Guaka

let rootCommand = Command(usage: "xcchef", run: execute)

private func execute(flags: Flags, args: [String]) {
  print(rootCommand.helpMessage)
}
