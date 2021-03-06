//
//  Profile.swift
//  Landmarks
//
//  Created by ζ¨δΈε₯δΈ on 2021/08/07.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalData = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "π·"
        case summer = "π"
        case autumn = "π"
        case winter = "βοΈ"
        
        var id: String { self.rawValue }
    }
}

