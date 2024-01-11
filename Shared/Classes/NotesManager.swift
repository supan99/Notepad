//
//  NotesManager.swift
//  Notepad
//
//  Created by supan on 10/01/24.
//

import Foundation
import SwiftUI

class NotesManager: ObservableObject {
    
    //MARK: Variables
    @Published var notes : [Note] = []
    

    //MARK: Inits
    
    init() {
        self.notes = [
//            Note(note: "Make proper App", isComplete: false),
//            Note(note: "Make proper App1", isComplete: false),
//            Note(note: "Make proper App2", isComplete: false),
//            Note(note: "Make proper App3", isComplete: false),
//            Note(note: "Make proper App4", isComplete: false)
        ]
    }
    
    //MARK: Functions
    
    ///Add Data into list
    func addData(note: Note) {
        withAnimation(.easeInOut(duration: 0.25)) {
            self.notes.append(note)
        }
    }
    
    ///Remove data from list
    func removeData(note: Note){
        withAnimation(.easeInOut(duration: 0.25)) {
            self.notes = self.notes.filter({$0.taskID != note.taskID})
        }
    }
    
    //Notes status update into list 
    func updateTaskStatus(note: Note) {
        guard let index = notes.firstIndex(where: {$0.taskID == note.taskID}) else { return }
        self.notes[index].toggleStatus()
    }
    
}
