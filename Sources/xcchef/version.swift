import Guaka

var versionCommand = Command(usage: "t", configuration: configuration, run: execute)

private func configuration(command: Command) {

  command.add(flags: [
    // Add your flags here
    ]
  )

  // Other configurations
}

private func execute(flags: Flags, args: [String]) {
  // Execute code here
  print("t called")
}
