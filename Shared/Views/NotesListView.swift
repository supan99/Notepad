//
//  NotesListView.swift
//  Notepad
//
//  Created by supan on 11/01/24.
//

import SwiftUI

struct NotesListView: View {
    //MARK: Variables
    @EnvironmentObject var notesManager : NotesManager
    private var index: Int = 0
    
    
    //MARK: Views
    var body: some View {
        //ScrollView
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(Array(notesManager.notes.enumerated()), id: \.offset) { index, notes in
                    TaskRowView(note: notes, index: index + 1)
                        .padding(.horizontal, 20)
                        .environmentObject(notesManager)
                }
            }
        }
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
