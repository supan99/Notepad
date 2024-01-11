//
//  HomeView.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import SwiftUI
import Foundation
//import CoreTelephony

struct HomeView: View {
    //MARK: State Variables
    @State private var txtNotes: String = ""
    @State private var isAdded : Bool = false
    @State private var isDetailViewActive = false
    @State private var editIndex : Int = -1
    @StateObject var global : Global = Global()
    
    
    @GestureState private var offset: CGSize = .zero
    
    //MARK: Observe Variables
    @ObservedObject var todo = Todo()
    
    //MARK: Action Function
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
        ZStack(alignment: .center){
            BackgroundImageView()
            VStack(alignment: .center){
                HomeHeaderView(isAdded: $isAdded, editIndex: $editIndex, noteCount: todo.notesList.count)
                    .environmentObject(global)
                centerView
                Spacer()
            }//: VSTACK
            .task { todo.getNotes() }
            .padding(.horizontal, CGFloat(20).makeZero())
        }//: ZStack
        .environmentObject(global)
    }//: body
    
    var centerView: some View {
        VStack(alignment: .leading) {
            if (isAdded){
//                HomeInputView(txtNotes: $txtNotes, editIndex: editIndex) {
//                    self.addAction()
//                }
            } else {
                if (todo.notesList.count > 0) {
                    listView
                } else {
                    NoDataFoundView(title: "No task found !!!", noDataImage: "notes.text")
                }
            }
        }//VSTACK
        .animation(.easeInOut(duration: 1.5), value: isAdded)
        .environmentObject(global)
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
        List {
//            VStack(alignment: .leading){
                let numbersOfTodo = todo.notesList.count
                ForEach(0..<numbersOfTodo, id: \.self) { todoIndex in
                    let task = todo.notesList[todoIndex]
                    NavigationLink(destination: TaskDetailsView(note: task, numberOfNotes: numbersOfTodo, currentNoteIndex: todoIndex)){
                        HStack{
                            Capsule()
                                .frame(width: CustomSize.size04)
                                .foregroundColor(task.isComplete ? .green : .orange)
                            Text(task.note)
                                .font(.system(size: CustomSize.size20, weight: .medium))
                                .foregroundColor(Global().colorAppearance)
                                .padding(.vertical, CustomSize.size08.makeZero())
                                .strikethrough(task.isComplete)
                                .lineLimit(Global().numberOfLines == 0 ? nil : Global().numberOfLines)
                                .multilineTextAlignment(TextAlignment.leading)
                            Spacer()
                        }//HSTACK
                        .padding(.vertical, CustomSize.size04.makeZero())
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
                            .clipShape(RoundedRectangle(cornerRadius: 10))
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
                }//LOOP: FOREACH
//                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
//            }//VSTACK
        }//: SCROLLVIEW
        .listStyle(PlainListStyle())
        .background(Color.clear)
    }//: listView
}


//MARK: PREVIEWS
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct SwipeActionView: View {
    var action: () -> Void
    var label: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue.opacity(0.1))
                .cornerRadius(32) // This applies the same corner radius as the row
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
            Button(action: action) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}
