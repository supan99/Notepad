//
//  DarkModeView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct DarkModeView: View {
    
    //MARK: Binding Variables
    @State private var isDarkMode : Bool = false
    
    //MARK: Main View
    var body: some View {
        VStack {
            HStack {
                SettingListTitleView(imageName: isDarkMode ? "moon.fill" : "sun.max.fill", titleName: "Dark Mode")
                Spacer()
                Toggle("", isOn: $isDarkMode)
                    .onTapGesture {
                        isDarkMode.toggle()
                    }//: Toggle
            }//: HStack
            .padding(.top, CGFloat(34.0).resizeFontSize())
            .padding(.vertical, CGFloat(10.0).resizeFontSize())
            Divider()
        }//:VStack
    }
}

struct DarkModeView_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeView()
    }
}
