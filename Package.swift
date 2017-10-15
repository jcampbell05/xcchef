import PackageDescription
let package = Package(
  name: "xcchef",
  dependencies: [
      .Package(url: "https://github.com/oarrabi/Guaka", majorVersion: 0),
      .Package(url: "https://github.com/kylef/PathKit", majorVersion: 0)
    ]
)
