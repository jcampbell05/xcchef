import Guaka

var newCommand = Command(
  usage: "new", configuration: configuration, run: execute)


private func configuration(command: Command) {

  command.add(flags: [
    // Add your flags here
    ]
  )

  // Other configurations
}

private func execute(flags: Flags, args: [String]) {
  // Execute code here
  print("new called")
}
