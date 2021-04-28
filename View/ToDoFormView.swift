//
//  ToDoFormView.swift
//  ToDo
//
//  Created by Maxim Macari on 20/4/21.
//

import SwiftUI
import Combine

struct ToDoFormView: View {
    
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var formVM: ToDoFormViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form {
                VStack(alignment: .leading) {
                    TextField("ToDo", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updateSaveButton)
        }
    }
}

extension ToDoFormView {
    func updateToDo() {
        let toDo = ToDo(id: formVM.id!, name: formVM.name, completed: formVM.completed)
        dataStore.updateToDo.send(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    func addToDo(){
        let toDo = ToDo(name: formVM.name)
        dataStore.addToDo.send(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View{
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Cancel")
        })
    }
    
    var updateSaveButton: some View {
        Button(action: {
            formVM.updating ? updateToDo() : addToDo()
        }, label: {
            Text(formVM.updating ? "Update" : "Save")
        })
        .disabled(formVM.isDisabled)
    }
}

struct ToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoFormView(formVM: ToDoFormViewModel())
            .environmentObject(DataStore())
    }
}
