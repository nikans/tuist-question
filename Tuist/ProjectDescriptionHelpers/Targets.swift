//
//  Targets.swift
//  ProjectDescriptionHelpers
//
//  Created by Eugene Kalyada on 03.06.2022.
//

import Foundation
import ProjectDescription

public enum TargetFramework: CaseIterable {
    
    case Stuff
}


extension TargetFramework {
    
    public var name: String {
        String(describing: self)
    }
    
    public var id: String {
        String(describing: self)
    }
}


extension TargetFramework {
    
//    public var resources: [ResourceFileElement] {
//        []
//    }
    
    public var dependencies: [TargetDependency] {
        return []
    }
}
