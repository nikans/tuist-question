import ProjectDescription
import ProjectDescriptionHelpers
import Foundation

// MARK: - Project

enum Config {
    static let marketingVersion: InfoPlist.Value = "1"
    static let buildVersion: InfoPlist.Value = "1"
    static let organizationName = "Stuff"
    static let bunldePrefix = "com.nikans."
    static let iosTargetVersion = "14.5"
}

let project = Project(
    name: "Stuff",
    organizationName: Config.organizationName,
    
    // SPM
    packages: [
    ],
    
    // Targets
    targets: [
        
        // Main target
        Target(
            name: "App",
            platform: .iOS,
            product: .app,
            bundleId: Config.bunldePrefix + "demo",
            deploymentTarget: .iOS(targetVersion: Config.iosTargetVersion, devices: .iphone),
            
            infoPlist: .extendingDefault(with: [
                "CFBundleShortVersionString": Config.marketingVersion,
                "CFBundleVersion": Config.buildVersion,
                "CFBundleDisplayName": "Stuff",
                "CFBundleIconName": ""
            ]),
            
            sources: ["Targets/App/Sources/**"],
            resources: ["Targets/App/Resources/**"],
            
            dependencies: TargetFramework.allCases.map { TargetDependency.target(name: $0.name) } +
            [
            ]
        )
        
        // Framework Targets
        ] + TargetFramework.allCases.flatMap({
            makeFrameworkTargets(target: $0, platform: .iOS)
        }),
    
    resourceSynthesizers: [
        .assets()
    ]
)


func makeFrameworkTargets(target: TargetFramework, platform: Platform) -> [Target] {
    let pathSource = "Targets/\(target.name)/Sources"
    let pathResource = "Targets/\(target.name)/Resources"
    let doesResourceFolderExist = FileManager.default.fileExists(atPath: pathResource, isDirectory: nil)
        
    let sources = Target(
        name: target.name,
        platform: platform,
        product: .framework,
        bundleId: Config.bunldePrefix + target.id,
        deploymentTarget: .iOS(targetVersion: Config.iosTargetVersion, devices: .iphone),
        infoPlist: .extendingDefault(with: [:]),
        sources: ["\(pathSource)/**"],
        resources: doesResourceFolderExist ? ["\(pathResource)/**"] : [],
        dependencies: target.dependencies
    )
    
    return [sources]
}
