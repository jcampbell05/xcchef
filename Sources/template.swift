import Guaka

var templateCommand = Command(
  usage: "template", configuration: configuration, run: execute)


private func configuration(command: Command) {

  command.add(flags: [
    // Add your flags here
    ]
  )

  // Other configurations
}

private func execute(flags: Flags, args: [String]) {
  // Execute code here
  print("template called")
}
