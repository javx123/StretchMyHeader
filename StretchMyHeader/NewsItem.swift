//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Javier Xing on 2017-12-05.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

import UIKit

struct NewsItem {
    var category : Category
    var headline: String
    
    enum Category {
        case World
        case America
        case Europe
        case MiddleEast
        case Africa
        case AsiaPacific
        
        func simpleDescription() -> String {
            switch self {
            case .World:
                return "World"
            case .America:
                return "America"
            case .Europe:
                return "Europe"
            case .MiddleEast:
                return "Middle East"
            case .Africa:
                return "Africa"
            case .AsiaPacific:
                return "Asia Pacific"
            }
        }
        
        func categoryColour() -> UIColor {
            switch self {
            case .World:
                return .red
            case .America:
                return .blue
            case .Europe:
                return .green
            case .MiddleEast:
                return .yellow
            case .Africa:
                return .orange
            case .AsiaPacific:
                return .purple
            }
        }
    }
}
