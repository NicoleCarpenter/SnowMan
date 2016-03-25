import PackageDescription

let package = Package(
  	name: "SnowMan",
  	targets: [
	  	Target(name: "SnowManDictionary"),
  		Target(name: "SnowManLogic"),
 		Target(name: "Application", dependencies: ["SnowManLogic", "SnowManDictionary"]),
 		Target(name: "SnowManDictionarySpecs", dependencies: ["SnowManDictionary"]),
 		Target(name: "SnowManLogicSpecs", dependencies: ["SnowManLogic"]),
  	],
  	dependencies: [
  		.Package(url: "https://github.com/bppr/Swiftest.git", Version(0,1,8))
  	]
)