//
//  HomeView.swift
//  Notepad
//
//  Created by supan on 15/12/23.
//

import SwiftUI
import Foundation

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
    
    private func makeStringUsingNoteNumber(_ index: Int) -> String {
        let count = todo.notesList.count
        var notesCount = "000"
        if (count > 999) {
            notesCount = "99+"
        } else if (count < 999 && count > 99) {
            notesCount = todo.notesList.count.description
        } else if (count < 99 && count > 9) {
            notesCount = "0"+count.description
        } else if (count <= 9) {
            notesCount = "00"+count.description
        }
        return Array(notesCount)[index].description
    }

    //MARK: Main View
    var body: some View {
        ZStack(alignment: .center){
            BackgroundImageView()
            VStack(alignment: .center){
                headerView
                centerView
                Spacer()
            }//: VSTACK
            .task { todo.getNotes() }
            .padding(.horizontal, CGFloat(20).makeZero())
        }
    }//: body
    
    var centerView: some View {
        VStack(alignment: .leading) {
            if (isAdded){
                HomeInputView(txtNotes: $txtNotes, editIndex: editIndex) {
                    self.addAction()
                }
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
        ScrollView {
            VStack(alignment: .leading){
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
                                .foregroundColor(ColorConst.titleBlack)
                                .padding(.vertical, CustomSize.size08.makeZero())
                                .strikethrough(task.isComplete)
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
            }//VSTACK
        }
        .navigationBarBackButtonHidden()
        
    }//: listView
    
    var headerView: some View {
        HStack(alignment: .center) {
            HStack(spacing: 0){
                Text("N")
                    .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                    .foregroundColor(ColorConst.titleBlack)
                Circle()
                    .stroke(ColorConst.primary, lineWidth: CustomSize.size06.resizeFontSize())
                    .frame(width: CustomSize.size30.resizeFontSize(), height: CustomSize.size30.resizeFontSize())
                    .overlay {
                        Text(self.makeStringUsingNoteNumber(0))
                            .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                            .foregroundColor(ColorConst.titleBlack)
                }
                Circle()
                    .stroke(ColorConst.primary, lineWidth: CustomSize.size06.resizeFontSize())
                    .frame(width: CustomSize.size30.resizeFontSize(), height: CustomSize.size30.resizeFontSize())
                    .overlay {
                        Text(self.makeStringUsingNoteNumber(1))
                            .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                            .foregroundColor(ColorConst.titleBlack)
                }
                Circle()
                    .stroke(ColorConst.primary, lineWidth: CustomSize.size06.resizeFontSize())
                    .frame(width: CustomSize.size30.resizeFontSize(), height: CustomSize.size30.resizeFontSize())
                    .overlay {
                        Text(self.makeStringUsingNoteNumber(2))
                            .font(.system(size: CustomSize.size24.resizeFontSize(), weight: .semibold))
                            .foregroundColor(ColorConst.titleBlack)
                }
                Text("TES")
                    .font(.system(size: CustomSize.size40.resizeFontSize(), weight: .semibold))
                    .foregroundColor(ColorConst.titleBlack)
            } //:HStack
            Spacer()
            Button {
                isAdded.toggle()
                editIndex = -1
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: CustomSize.size35.resizeFontSize(), weight: .semibold))
            }//BUTTON
            .fixedSize()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(ColorConst.primary)
            .rotationEffect(Angle(degrees: isAdded ? 315 : 0))
            .animation(.easeOut(duration: 0.5), value: isAdded)
        }//HSTACK
        .task {
//            self.makeStringUsingNoteNumber(0)
        }
    }
}


//MARK: PREVIEWS
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
