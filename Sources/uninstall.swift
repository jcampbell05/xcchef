import Guaka

let uninstallCommand = Command(usage: "uninstall", configuration: configuration, run: execute)

private func execute(flags: Flags, args: [String]) {
  let templateManager = TemplateManager()
  
  if args.count > 0 {
    templateManager.uninstall(sourceComponents: args)
  } else {
    print(installCommand.helpMessage)
  }
}
