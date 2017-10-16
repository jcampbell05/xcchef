import Guaka

let installCommand = Command(usage: "install", run: execute)

private func execute(flags: Flags, args: [String]) {

  let templateManager = TemplateManager()
  
  if args.count > 0 {
    templateManager.install(templateSources: args)
  } else {
    print(installCommand.helpMessage)
  }
}
