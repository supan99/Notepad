//
//  TaskDetailsCenterView.swift
//  Notepad
//
//  Created by supan on 14/12/23.
//

import SwiftUI

struct TaskDetailsCenterView: View {
    
    //MARK: Struct Variables
    let notes : Note
    
    //MARK: Observe Variables
    @State private var primaryColor = ColorConst.secondary
    @State private var lineNumber = 0
    
    //MARK: Main View
    var body: some View {
        ScrollView(.vertical) {
            Text(notes.note)
                .padding([.top, .horizontal], CustomSize.size10.makeZero())
                .foregroundColor(primaryColor)
                .font(.system(size: CustomSize.size20, weight: .medium ))
                .multilineTextAlignment(.leading)
                .lineLimit(lineNumber == 0 ? nil : lineNumber)
        }//: SCROLLVIEW
        .padding(.vertical, CGFloat(10).makeZero())
        .onAppear {
            primaryColor = Global().colorAppearance
            lineNumber = Global().numberOfLines
        }
    }
}

struct TaskDetailsCenterView_Previews: PreviewProvider {
    static var notes  = Note(note: "Hello Dev", isComplete: false)
    static var previews: some View {
        TaskDetailsCenterView(notes: notes)
    }
}
