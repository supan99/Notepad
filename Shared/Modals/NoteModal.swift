//
//  NoteModal.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import Foundation

struct Note: Encodable, Decodable {
    // Add properties for your message
    var note: String
    var isComplete: Bool
}
