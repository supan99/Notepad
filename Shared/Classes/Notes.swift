//
//  Notes.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import Foundation
import Combine
import WatchConnectivity

final class Todo: ObservableObject {
    
    //MARK: Class Variables
    var session: WCSession
    let delegate: WCSessionDelegate
    let notes = PassthroughSubject<[Note], Never>()
    @Published var notesList: [Note] = []
    
    //MARK: Class Functions
    init(session: WCSession = .default) {
        self.delegate = SessionDelegate(notesSubject: notes)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
        
        notes
            .receive(on: DispatchQueue.main)
            .assign(to: &$notesList)
    }
    
    
    //MARK: Custom Methods
    //Add notes into list action
    func add(_ notes: Note) {
        self.notesList.append(notes)
        self.sendData()
    }
    
    //Update notes status action
    func updateNoteTask(_ index: Int) {
        self.notesList[index].isComplete.toggle()
        self.sendData()
    }
    
    //Edit note action
    func editNote(_ index: Int, _ note: String) {
        self.notesList[index].note = note
        self.sendData()
    }
    
    //Delete note Action
    func deleteNote(_ removeIndex: Int) {
        notesList.remove(at: removeIndex)
        self.sendData()
    }
    
    //Send data from Mobile to watch and viceVersa
    func sendData() {
        self.save()
        do {
            let data = try JSONEncoder().encode(notesList)
            let json = String(data: data, encoding: String.Encoding.utf8)?.description
            if let jsonStr = json {
                let message = ["notes": jsonStr]
                session.sendMessage(message, replyHandler: nil){ error in
                    print(error.localizedDescription)
                }
            }
        } catch {
            print("Error while generating JSON")
        }
    }
    
    //Get Local Storage Path
    func getDirectoryPath() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]

    }
    
    //Get data function
    func getNotes() {
        DispatchQueue.main.async {
            do {
                let url = self.getDirectoryPath()
                let data = try Data(contentsOf: url.appendingPathComponent("Notes"))
                print("Directory Path ===> ", url)
                self.notesList = try JSONDecoder().decode([Note].self, from: data)
                if (self.notesList.isEmpty) {
                    self.notesList.append(Note(note: "iOS 😎😎", isComplete: false))
                    self.notesList.append(Note(note: "Watch OS 😎", isComplete: true))
                }
                self.sendData()
            }catch{
                print("Error is occur while fetching data from localDB")
            }
        }
    }
    
    //Save data Function
    func save() {
        do {
            let data = try JSONEncoder().encode(self.notesList)
            let url = getDirectoryPath().appendingPathComponent("Notes")
            try data.write(to: url)
        }catch{
            print("Error is occur while saving data")
        }
    }
}
