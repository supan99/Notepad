//
//  TaskDetailsCenterView.swift
//  Notepad
//
//  Created by supan on 14/12/23.
//

import SwiftUI

struct TaskDetailsCenterView: View {
    let notes : Note
    var body: some View {
        ScrollView(.vertical) {
            Text(notes.note)
                .padding(.top, 10)
                .font(.system(size: 16, weight: .medium ))
                .multilineTextAlignment(.center)
        }//: SCROLLVIEW
    }
}

struct TaskDetailsCenterView_Previews: PreviewProvider {
    static var notes  = Note(note: "Hello Dev", isComplete: false)
    static var previews: some View {
        TaskDetailsCenterView(notes: notes)
    }
}
