//
//  LineLimitView.swift
//  Notepad
//
//  Created by supan on 21/12/23.
//

import SwiftUI

struct LineLimitView: View {
    //MARK: State Variables
    @EnvironmentObject private var global : Global
    @State private var lineLimit = 0
    
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
        .task {
            lineLimit = global.numberOfLines
        }
        .onChange(of: lineLimit, perform: { newValue in
            global.numberOfLines = newValue
        })
    }
}

struct LineLimitView_Previews: PreviewProvider {
    static var previews: some View {
        LineLimitView()
    }
}
