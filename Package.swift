import PackageDescription

let package = Package(
  	name: "SnowMan",
  	targets: [
	  	Target(name: "WordList"),
  		Target(name: "Application"),
 		Target(name: "snowman", dependencies: ["Application", "WordList"]),
 		Target(name: "WordListSpecs", dependencies: ["WordList"]),
 		Target(name: "ApplicationSpecs", dependencies: ["Application"]),
  	],
  	dependencies: [
  		.Package(url: "https://github.com/bppr/Swiftest.git", Version(0,1,8))
  	]
)