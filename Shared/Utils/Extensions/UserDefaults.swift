//
//  UserDefault.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import Foundation
import SwiftUI

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}

struct UserDefaultsConfig {
    @UserDefault(UserDefaults.Keys.currentUser, defaultValue: false)
    static var currentUser: Bool
    
    @UserDefault(UserDefaults.Keys.authorization, defaultValue: false)
    static var isAuthorization: Bool
    
    @UserDefault(UserDefaults.Keys.lineLimit, defaultValue: 0)
    static var lineLimit: Int
    
    @UserDefault(UserDefaults.Keys.darkMode, defaultValue: false)
    static var darkMode: Bool
    
    @UserDefault(UserDefaults.Keys.colorAppearance, defaultValue: ColorConst.secondary.toHex ?? "E90000")
    static var colorAppearance: String
    
    @UserDefault(UserDefaults.Keys.displayTotalCount, defaultValue: false)
    static var displayTotalCount: Bool
    
    @UserDefault(UserDefaults.Keys.skinCode, defaultValue: 0)
    static var skinCode: Int
    
}
