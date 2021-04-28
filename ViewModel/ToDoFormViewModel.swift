//
//  ToDoFormViewModel.swift
//  ToDo
//
//  Created by Maxim Macari on 20/4/21.
//

import SwiftUI

class ToDoFormViewModel: ObservableObject {
    @Published var name = ""
    @Published var completed = false
    var id: String?
    
    // cheeking if id is null or not
    var updating: Bool {
        id != nil
    }
    
    var isDisabled: Bool {
        name.isEmpty
    }
    
    //doesnt requiere us to pass a ToDo
    init() {}
    
    init(_ currentToDo: ToDo) {
        self.name = currentToDo.name
        self.completed = currentToDo.completed
        id = currentToDo.id
    }

}
    
