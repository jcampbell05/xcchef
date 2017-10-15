import Guaka

let updateCommand = Command(usage: "update", run: execute)

private func execute(flags: Flags, args: [String]) {
  let templateManager = TemplateManager()
  
  if args.count > 0 {
    templateManager.update(sourceComponents: args)
  } else {
    print(installCommand.helpMessage)
  }
}
