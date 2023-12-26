//
//  NotepadApp.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import SwiftUI
import Foundation

@main
struct NotepadApp: App {

    @StateObject private var global: Global = Global()
    
    var paddingStyle: CGFloat {
        #if os(watchOS)
        return 0.0
        #else
        return 20.0
        #endif
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
//                TwitterAnimationView()
//                ContentView()
            }//: Navigation View
            .environmentObject(global)
        }
    }
}
