//
//  SessionDelegate.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import Foundation
import Combine
import WatchConnectivity

class SessionDelegate: NSObject, WCSessionDelegate {
    let notesList: PassthroughSubject<[Note], Never>
    
    init(notesSubject: PassthroughSubject<[Note], Never>) {
        self.notesList = notesSubject
        super.init()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Protocol comformance only
        // Not needed for this demo
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            do {
                if let notes = message["notes"] as? String, let data = notes.data(using: .utf8) {
                    let notesData = try JSONDecoder().decode([Note].self, from: data)
                    self.notesList.send(notesData)
                } else {
                    print("There was an error")
                }
            } catch {
                print("There was an error While convering into Modal")
            }
        }
    }
    
    
    // iOS Protocol comformance
    // Not needed for this demo otherwise
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // Activate the new session after having switched to a new watch.
        session.activate()
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    #endif
}

