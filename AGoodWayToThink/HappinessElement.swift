//
//  HappinessElements.swift
//  AGoodWayToThink
//
//  Created by James Birtwell on 11/06/2017.
//  Copyright © 2017 James Birtwell. All rights reserved.
//

import Foundation

class HappinessElement {
    var type: HappinessElementType
    var score: Int
    var components = [ElementComponent]()
    
    init(type: HappinessElementType, score: Int) {
        self.type = type
        self.score = score
    }
}

enum HappinessElementType: Int {
    case LovingConnections, LifeAlignedToValues, HealthyPerspective, LiveNowMindfully, GratefulMindset, PostiveThoughts
    
    static var all:[HappinessElementType] {
        return [.LovingConnections, .LifeAlignedToValues, .HealthyPerspective, .LiveNowMindfully, .GratefulMindset, .PostiveThoughts]
    }
    
    var navTitle: String {
        switch self {
        case .LovingConnections:
            return "Loving Connections"
        case .LifeAlignedToValues:
            return "Life Aligned To Value"
        case .HealthyPerspective:
            return "Healthy Perspective"
        case .LiveNowMindfully:
            return "Live Now, Mindfully"
        case .GratefulMindset:
            return "Grateful Mindset"
        case .PostiveThoughts:
            return "Postitive Thoughts"
        }
    }
}

protocol ElementComponent {
    
}
