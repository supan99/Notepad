//
//  TaskDetailsView.swift
//  DemoWatchApp Watch App
//
//  Created by supan on 14/12/23.
//

import SwiftUI

struct TaskDetailsView: View {

    //MARK: VARIABLES
    let note: Note
    let numberOfNotes: Int
    let currentNoteIndex : Int
    
    
    //MARK: VIEWS
    var body: some View {
        ZStack(alignment: .center) {
            BackgroundImageView()
            VStack {
                TaskDetailsHeaderView()
                TaskDetailsCenterView(notes: note)
                TaskDetailsFooterView(numberOfNotes: numberOfNotes, currentNoteIndex: currentNoteIndex)
            }//:VSTACK
        }
    }//: body
}

//MARK: PREVIEWS
struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView(note: Note(note: "Hello iOS Dev", isComplete: false), numberOfNotes: 5, currentNoteIndex: 1)
    }
}
