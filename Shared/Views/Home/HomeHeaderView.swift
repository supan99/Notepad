//
//  HomeHeaderView.swift
//  Notepad
//
//  Created by supan on 18/12/23.
//

import SwiftUI
import Combine

struct HomeHeaderView: View {
    
    //MARK: Binding Variables
    @Binding var isAdded: Bool
    @Binding var editIndex: Int
    
    //MARK: Struct Variables
    var noteCount: Int
    
    //MARK: State Variables
    @State private var showDisplay : Bool = false
    @State private var skinCode : Int = Global().skinCode
    
    //MARK: Custom Functions
    //Function for Notes Count
    private func makeStringUsingNoteNumber(_ index: Int) -> String {
        let count = noteCount
        var notesCount = "000"
        if (count > 999) {
            notesCount = "99+"
        } else if (count < 999 && count > 99) {
            notesCount = noteCount.description
        } else if (count < 99 && count > 9) {
            notesCount = "0"+count.description
        } else if (count <= 9) {
            notesCount = "00"+count.description
        }
        return Array(notesCount)[index].description
    }
    
    //Function for Make Circle View for notes count
    private func CircleView(_ count: String) -> some View {
        Circle()
            .stroke(Global().colorAppearance, lineWidth: CustomSize.size06.resizeFontSize())
            .frame(width: CustomSize.size30.resizeFontSize(), height: CustomSize.size30.resizeFontSize())
            .overlay {
                if (showDisplay) {
                    Text(count)
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                        .foregroundColor(ColorConst.titleBlack)
                }
            }
            .onAppear {
            }
    }
    
    
    //MARK: Main View
    var body: some View {
        HStack(alignment: .center) {
            HStack(spacing: 0){
                Text("N")
                    .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                    .foregroundColor(ColorConst.titleBlack)
                
                HomeCircleView(count: self.makeStringUsingNoteNumber(0))
                HomeCircleView(count: self.makeStringUsingNoteNumber(1))
                HomeCircleView(count: self.makeStringUsingNoteNumber(2))
                
                Text("TES")
                    .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                    .foregroundColor(ColorConst.titleBlack)
            } //:HStack
            Spacer()
            Button {
                isAdded.toggle()
                editIndex = -1
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: CustomSize.size35.resizeFontSize(), weight: .semibold))
            }//BUTTON
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(Global().colorAppearance)
            .rotationEffect(Angle(degrees: isAdded ? 315 : 0))
            .animation(.easeOut(duration: 0.5), value: isAdded)
        }//HSTACK
        .onAppear {
            print("SKIN CODE ===> ",skinCode, Global().skinCode)
            skinCode = Global().skinCode
            showDisplay = Global().isDisplayTotalCount
            print("HOME HEADER BODY ===> ", skinCode)
        }
        .environmentObject(Global())
    }//: body
}

struct HomeHeaderView_Previews: PreviewProvider {
    @State static var isAdded: Bool = false
    @State static var editIndex: Int = -1
    @State static var noteCount: Int = 1000
    static var previews: some View {
        HomeHeaderView(isAdded: $isAdded, editIndex: $editIndex, noteCount: noteCount)
    }
}
