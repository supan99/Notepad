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
    
    //MARK: Binding Variables
    @Binding var txtNotes : String
    
    //MARK: Class Variables
    let editIndex : Int
    
    //MARK: Functions
    var addAction : () -> ()
    
    //MARK: Main View
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter notes here...", text: self.$txtNotes)
                .font(.system(size: CustomSize.size20.resizeFontSize(), weight: .medium))
                .foregroundColor(ColorConst.titleBlack)
            Spacer()
            if (self.txtNotes.count > 0) {
                Button {
                } label: {
                    Text(editIndex == -1 ? "Add".uppercased() : "Save".uppercased())
                        .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                        .padding(.vertical, CustomSize.size14.resizeFontSize())
                }
                .frame(minWidth: 80, maxWidth: .infinity)
                .buttonStyle(.plain)
                .background(global.colorAppearance)
                .foregroundColor(ColorConst.white)
                .cornerRadius(CustomSize.size10.resizeFontSize())
                .padding(.top, CustomSize.size20.makeZero())
                .onTapGesture {
                    self.addAction()
                }
            }
        }//VSTACK
    }//: Body
}

struct HomeInputView_Previews: PreviewProvider {
    @State static var txtNotes  = ""
    static var previews: some View {
        HomeInputView(txtNotes: $txtNotes, editIndex: -1) {
            print("Add Action Called")
        }
    }
}
