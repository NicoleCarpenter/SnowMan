import PackageDescription

let package = Package(
  	name: "SnowMan",
  	targets: [
	  	Target(name: "Dictionary"),
  		Target(name: "SnowManLogic"),
 		Target(name: "Application", dependencies: ["SnowManLogic", "Dictionary"]),
 		Target(name: "DictionarySpecs", dependencies: ["Dictionary"]),
 		Target(name: "SnowManLogicSpecs", dependencies: ["SnowManLogic"]),
  	],
  	dependencies: [
  		.Package(url: "https://github.com/bppr/Swiftest.git", Version(0,1,8))
  	]
)