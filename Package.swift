// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Utsname",
    products: [
        .library(name: "Utasname", targets: ["Utasname"])
    ],
    targets: [
        .target(
            name: "Utasname",
            path: "Utsname",
            exclude: []
        )
    ]
)

