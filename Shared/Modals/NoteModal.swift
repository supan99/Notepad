//
//  NoteModal.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import Foundation

final class Note: Codable, ObservableObject {
    
    //MARK: Variables
    // Add properties for your message
    @Published var note: String
    @Published var isComplete: Bool
    
    let taskID : String = UUID().uuidString
    
    
    enum CodingKeys: String, CodingKey {
        case note
        case isComplete
        case taskID
    }
    
    //MARK: Inits
    init(note: String, isComplete: Bool) {
        self.note = note
        self.isComplete = isComplete
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        note = try values.decode(String.self, forKey: .note)
        isComplete = try values.decode(Bool.self, forKey: .isComplete)
    }
    
    //Encode from Observable Object
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(note, forKey: .note)
        try container.encode(isComplete, forKey: .isComplete)
        try container.encode(taskID, forKey: .taskID)
    }
    
    //MARK: Functions
    
    ///Toggle Notes status
    func toggleStatus() {
        self.isComplete.toggle()
    }
}
