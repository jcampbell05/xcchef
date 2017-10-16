import Guaka

let uninstallCommand = Command(usage: "uninstall", run: execute)

private func execute(flags: Flags, args: [String]) {
  let templateManager = TemplateManager()
  
  if args.count > 0 {
    templateManager.uninstall(templateSources: args)
  } else {
    print(installCommand.helpMessage)
  }
}
