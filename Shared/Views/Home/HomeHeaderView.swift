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
    @EnvironmentObject var notesManager: NotesManager
    
    @Binding var isAdded: Bool
    @Binding var editIndex: Int
    
    //MARK: Struct Variables
    var noteCount: Int
    
    //MARK: State Variables
    @State private var showDisplay : Bool = false
    @State private var skinCode : Int = Global().skinCode
    @State private var colorCode : Color = Global().colorAppearance
    
    //MARK: Custom Functions
    
    
    //Function for Make Circle View for notes count
    private func CircleView(_ count: String) -> some View {
        Circle()
            .stroke(self.colorCode, lineWidth: CustomSize.size06.resizeFontSize())
            .frame(width: CustomSize.size30.resizeFontSize(), height: CustomSize.size30.resizeFontSize())
            .overlay {
                if (showDisplay) {
                    Text(count)
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                        .foregroundColor(ColorConst.titleBlack)
                }
            }
    }
    
    
    //MARK: Main View
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                SkinHeaderView(noteCount: noteCount)
                Spacer()
                AddButtonView(isAdded: $isAdded, editIndex: $editIndex, colorCode: self.colorCode)
                    .environmentObject(Global())
            }//HSTACK
            
            if (isAdded) {
                HomeInputView(isAdded: $isAdded, editIndex: editIndex)
                    .padding(.horizontal, 20)
                    .environmentObject(notesManager)
            }
        }
        .onAppear {
            skinCode = Global().skinCode
            showDisplay = Global().isDisplayTotalCount
            colorCode = Global().colorAppearance
        }
        .environmentObject(Global())
    }//: body
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView(isAdded: .constant(true), editIndex: .constant(-1), noteCount: 1000)
    }
}


struct AddButtonView: View {
    //MARK: Variables
    @Binding var isAdded: Bool
    @Binding var editIndex: Int
    
    @State private var isAnimation : Bool = false
    var colorCode : Color
    
    //MARK: Views
    var body: some View {
        if (isAdded || editIndex != -1) {
            Button {
                isAdded.toggle()
                editIndex = -1
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: CustomSize.size35.resizeFontSize(), weight: .semibold))
            }//BUTTON
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(self.colorCode)
            .rotationEffect(Angle(degrees: isAnimation ? 315 : 0))
            .animation(.easeOut(duration: 0.5), value: isAnimation)
            .onAppear {
                isAnimation = true
            }
            .onDisappear {
                isAnimation = false
            }
        } else {
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: CGFloat(35).resizeFontSize().resizeFontSize(), height: CGFloat(35).resizeFontSize().resizeFontSize())
                    .foregroundColor(self.colorCode)
                    .rotationEffect(Angle(degrees: isAnimation ? 180 : 0))
                    .animation(.easeOut(duration: 0.5), value: 0)
            }
        }
    }
}

struct SkinHeaderView: View {
    //MARK: Variables
    var noteCount: Int
    
    //MARK: Functions
    //Function for Notes Count
    func makeStringUsingNoteNumber(_ index: Int) -> String {
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
    
    
    //MARK: Views
    var body: some View {
        HStack(spacing: 0){
            Text("N")
                .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold, design: .monospaced))
                .foregroundColor(ColorConst.titleBlack)
                .padding(.trailing, 2)
            
            HomeCircleView(count: self.makeStringUsingNoteNumber(0))
            HomeCircleView(count: self.makeStringUsingNoteNumber(1))
            HomeCircleView(count: self.makeStringUsingNoteNumber(2))
            
            Text("TES")
                .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold, design: .monospaced))
                .foregroundColor(ColorConst.titleBlack)
        }
    }
}
