//
//  Todo.swift
//  ToDo
//
//  Created by Maxim Macari on 20/4/21.
//

import SwiftUI
import Foundation

struct ToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [
            ToDo(name: "Get groceries"),
            ToDo(name: "Make Dr. Appointment", completed: true)
        ]
    }

}
    
