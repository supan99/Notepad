//
//  DisplayTotalSceneCountView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct DisplayTotalSceneCountView: View {
    
    //MARK: Binding Variables
    @Binding var showCount : Bool
    
    //MARK: Main View
    var body: some View {
        VStack{
            HStack(spacing: 0){
                SettingListTitleView(imageName: "00.square.fill", titleName: "Display total count")
                Toggle("", isOn: $showCount)
                    .onTapGesture {
                        showCount.toggle()
                    }//: Toggle
                    .frame(width: 100)
            }//: HStack
            .padding(.vertical, CGFloat(10.0).resizeFontSize())
            Divider()
        }//:VStack
    }
}

struct DisplayTotalSceneCountView_Previews: PreviewProvider {
    @State static var showCount = false
    static var previews: some View {
        DisplayTotalSceneCountView(showCount: $showCount)
    }
}
