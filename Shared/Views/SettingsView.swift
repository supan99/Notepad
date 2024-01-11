//
//  SettingsView.swift
//  Notepad
//
//  Created by supan on 20/12/23.
//

import SwiftUI

struct SettingsView: View {

    //MARK: State Variables
    @StateObject private var global: Global = Global()
    
    //MARK: Environment Variables
    @Environment(\.presentationMode) private var presentationMode //declare for a dismiss view
    
    //MARK: Action Functions
    private func dismissView() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    //MARK: Main View
    var body: some View {
        ZStack{
            BackgroundImageView()
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    #if os(iOS)
                    SettingHeaderView(){
                        self.dismissView()
                    }
                    #endif
                    SettingCenterView()
                        .padding(.horizontal, CustomSize.size10.resizeFontSize())
                    SettingFooterView()
                        .padding(.horizontal, CustomSize.size10.resizeFontSize())
                }//: VStack
            }//: ScrollView
            .padding(.horizontal, CGFloat(10).resizeFontSize())
        }//: ZStack
        .environmentObject(global)
        .navigationBarBackButtonHidden()
    }//: Body Main View
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
