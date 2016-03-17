import PackageDescription

let package = Package(
  	name: "SnowMan",
  	targets: [
  		Target(name: "Dictionary"),
  		Target(name: "SnowManLogic"),
 		Target(name: "Application", dependencies: ["SnowManLogic", "Dictionary"]),
 		Target(name: "Specs", dependencies: ["SnowManLogic", "Dictionary"]),
  	],
  	dependencies: [
    	.Package(url: "https://github.com/bppr/Swiftest.git", Version(0,1,8))
  	]
)
 