// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Utsname",
    products: [
        .library(name: "Utsname", targets: ["Utsname"])
    ],
    targets: [
        .target(
            name: "Utsname",
            path: "Utsname",
            exclude: []
        )
    ]
)

