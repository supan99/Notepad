//
//  TaskDetailsHeaderView.swift
//  Notepad
//
//  Created by supan on 14/12/23.

import SwiftUI

struct TaskDetailsHeaderView: View {
    //MARK: Main View
    var body: some View {
        HStack(alignment: .center) {
            SeparatorView()
            Image(systemName: "note.text")
                .resizable()
                .renderingMode(.template)
                .frame(width: CGFloat(38).resizeFontSize().resizeFontSize(), height: CGFloat(34).resizeFontSize().resizeFontSize())
                .foregroundColor(.accentColor)
            SeparatorView()
        }//: HSTACK
    }//: body
}

//MARK: PREVIEWS
struct TaskDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsHeaderView()
    }
}
