import PackageDescription

let package = Package(
  name: "SwiftSDL",
  targets: [
    Target(name: "SwiftSDLDemo",
           dependencies: [.Target(name: "SwiftSDL")])
  ],
  dependencies: [
    .Package(url: "https://github.com/SwiftSDL/CSDL.git", majorVersion: 0),
    .Package(url: "https://github.com/SwiftSDL/CSDLImage.git", majorVersion: 0),
    .Package(url: "https://github.com/SwiftSDL/CSDLTTF.git", majorVersion: 0)
  ]
)
