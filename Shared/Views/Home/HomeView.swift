//
//  HomeView.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import SwiftUI

struct HomeView: View {
    //MARK: Variables
    @State private var txtNotes: String = ""
    @State private var isAdded : Bool = false
    @State private var isDetailViewActive = false
    @State private var editIndex : Int = -1
    @ObservedObject var todo = Todo()
    
    //Add Notes into list function
    func addAction() {
        (editIndex != -1) ? todo.editNote(editIndex, txtNotes) : todo.add(Note(note: txtNotes, isComplete: false))
        txtNotes = ""
        editIndex = -1
        isAdded = false
    }
    
    //Edit View Action from functions
    func editAction(_ todoIndex: Int, _ task: Note) {
        editIndex = todoIndex
        txtNotes = task.note
        isAdded = true
    }
    
    //Right Swipe Action from list
    func rightSwipeAction(_ notesIndex: Int, _ isDelete: Bool) {
        isDelete ? todo.deleteNote(notesIndex) : todo.updateNoteTask(notesIndex)
    }
    
    //MARK: Main View
    var body: some View {
        VStack(alignment: .leading){
            HomeHeaderView(isAdded: $isAdded, editIndex: $editIndex)
            centerView
            Spacer()
        }//: VSTACK
        .task { todo.getNotes() }
        .padding(.horizontal, 20)
    }//: body
    
    var centerView: some View {
        VStack(alignment: .leading) {
            if (isAdded){
                inputView
            } else {
                if (todo.notesList.count > 0) {
                    listView
                } else {
                    NoDataFoundView(title: "No task found !!!", noDataImage: "notes.text")
                }
            }
        }//VSTACK
        .animation(.easeInOut(duration: 1.5), value: isAdded)
    }//: centerView
    
    var inputView: some View {
        VStack(alignment: .leading){
            TextField("Enter notes here...", text: self.$txtNotes)
            if (self.txtNotes.count > 0) {
                Button {
                    self.addAction()
                } label: {
                    Text(editIndex == -1 ? "Add" : "Save")
                }
            }
        }//VSTACK
    }//: inputView
    
    var listView: some View {
        VStack(alignment: .leading){
            Text("\(todo.notesList.count) Note")
            List{
                let numbersOfTodo = todo.notesList.count
                ForEach(0..<numbersOfTodo, id: \.self) { todoIndex in
                    let task = todo.notesList[todoIndex]
                    NavigationLink(destination: TaskDetailsView(note: task, numberOfNotes: numbersOfTodo, currentNoteIndex: todoIndex)) {
                        HStack{
                            Capsule()
                                .frame(width: 4)
                                .foregroundColor(task.isComplete ? .green : .orange)
                            Text(task.note)
                                .strikethrough(task.isComplete)
                            Spacer()
                        }//HSTACK
                        .swipeActions(edge: .leading) {
                            Button {
                                self.editAction(todoIndex, task)
                            } label: {
                                Image(systemName: "pencil")
                            }
                            .tint(.indigo)
                        }// SWIPE ACTION LEADING
                        .swipeActions(edge: .trailing) {
                            Button {
                                withAnimation {
                                    self.rightSwipeAction(todoIndex, true)
                                }
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                            
                            Button {
                                withAnimation {
                                    self.rightSwipeAction(todoIndex, false)
                                }
                            } label: {
                                Image(systemName:  task.isComplete ? "heart.slash" : "heart.fill")
                            }
                            .tint(.green)
                        }// SWIPE ACTION TRAILING
                    }//: Navigation Link
//                    .cornerRadius(10)
                }//LOOP: FOREACH
            }//LIST
        }//VSTACK
    }//: listView
}


//MARK: PREVIEWS
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
