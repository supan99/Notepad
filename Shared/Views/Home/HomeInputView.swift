//
//  HomeInputView.swift
//  Notepad
//
//  Created by supan on 20/12/23.
//

import SwiftUI

struct HomeInputView: View {
    
    //MARK: State Variables
    @ObservedObject var global : Global  = Global()
    @EnvironmentObject var notesManager: NotesManager
    
    //MARK: Binding Variables
    @State private var txtNotes : String = ""
    @Binding var isAdded : Bool
    
    //MARK: Class Variables
    let editIndex : Int
    
    //MARK: Functions
    
    //MARK: Main View
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter notes here...", text: self.$txtNotes,  axis: .vertical)
//                .lineLimit(5...10)
                .font(.system(size: CustomSize.size20.resizeFontSize(), weight: .medium))
                .foregroundColor(ColorConst.titleBlack)
            Spacer()
            if (self.txtNotes.count > 0) {
                HStack {
                    Spacer()
                    Text(editIndex == -1 ? "Add".uppercased() : "Save".uppercased())
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                        .padding(.vertical, CustomSize.size14.resizeFontSize())
                    Spacer()
                }
                .frame(minWidth: 80, maxWidth: .infinity)
                .buttonStyle(.plain)
                .background(global.colorAppearance)
                .foregroundColor(ColorConst.white)
                .cornerRadius(CustomSize.size10.resizeFontSize())
                .padding(.top, CustomSize.size20.makeZero())
                .onTapGesture {
                    notesManager.addData(note: Note(note: txtNotes, isComplete: false))
                    isAdded.toggle()
                }
            }
        }//VSTACK
    }//: Body
}

struct HomeInputView_Previews: PreviewProvider {
    static var previews: some View {
        HomeInputView(isAdded: .constant(false), editIndex: -1)
//        {
//            print("Add Action Called")
//        }
    }
}
