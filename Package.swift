import PackageDescription

let package = Package(
  	name: "SnowMan",
  	targets: [
  		Target(name: "Dictionary"),
  		Target(name: "SnowManLogic", dependencies: ["Dictionary"]),
 		Target(name: "Application", dependencies: ["SnowManLogic"]),
 		Target(name: "Specs", dependencies: ["SnowManLogic"]),
  	],
  	dependencies: [
    	.Package(url: "https://github.com/bppr/Swiftest.git", Version(0,1,8))
  	]
)
 