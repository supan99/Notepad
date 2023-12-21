//
//  LineLimitView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct LineLimitView: View {
    //MARK: State Variables
    @State private var lineLimit = 1
    
    //MARK: Main View
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10){
                SettingListTitleView(imageName: "note.text", titleName: "Line Limit \(lineLimit)")
                Spacer()
                Stepper("", value: $lineLimit, in: 0...5)//: Stepper
                    .fixedSize()
            }//: HStack
            .padding(.vertical, CGFloat(10.0).resizeFontSize())
            Divider()
        }//: VStack
    }
}

struct LineLimitView_Previews: PreviewProvider {
    static var previews: some View {
        LineLimitView()
    }
}
