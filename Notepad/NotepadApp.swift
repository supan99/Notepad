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
    //MARK: Variables
    @StateObject private var global: Global = Global()
    
    
    //MARK: Views
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeSecondView()
            }//: Navigation View
            .environmentObject(global)
        }
    }
}
