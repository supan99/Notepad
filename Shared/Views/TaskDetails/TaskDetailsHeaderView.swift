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
            Capsule()
                .foregroundColor(.accentColor)
                .frame(height: 2)
            Image(systemName: "note.text")
            Capsule()
                .foregroundColor(.accentColor)
                .frame(height: 2)
        }//: HSTACK
    }//: body
}

//MARK: PREVIEWS
struct TaskDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsHeaderView()
    }
}
