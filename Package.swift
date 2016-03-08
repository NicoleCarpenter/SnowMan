import PackageDescription

let package = Package(
  name: "SnowMan",
  dependencies: [
    .Package(url: "https://github.com/bppr/Swiftest.git", Version(0,1,7))
  ]
)
 