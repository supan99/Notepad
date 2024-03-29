//
//  UserDefault+Extension.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import Foundation

//MARK: User defaults keys
extension UserDefaults {
    public enum Keys {
        static var authorization        = "authorization" //isLogin
        static let currentUser          = "currentUser"
        static let lineLimit            = "lineLimit"
        static let darkMode             = "darkMode"
        static let colorAppearance      = "colorAppearance"
        static let displayTotalCount    = "displatTotalCount"
        static let skinCode             = "skinCode"
    }
}

extension UserDefaults {
    func decode<T : Codable>(for type : T.Type, using key : String) -> T? {
        let defaults = UserDefaults.standard
        guard let data = defaults.object(forKey: key) as? Data else {return nil}
        let decodedObject = try? PropertyListDecoder().decode(type, from: data)
        return decodedObject
    }
    
    func encode<T : Codable>(for type : T, using key : String) {
        let defaults = UserDefaults.standard
        let encodedData = try? PropertyListEncoder().encode(type)
        defaults.set(encodedData, forKey: key)
        defaults.synchronize()
    }
}
