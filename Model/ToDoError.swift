//
//  ToDoError.swift
//  ToDo
//
//  Created by Maxim Macari on 22/4/21.
//

import Foundation

enum ToDoError: Error, LocalizedError {
    case saveError
    case readError
    case decodingError
    case encodingError
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return NSLocalizedString("Could not save ToDos, please reinstall the app.", comment: "")
        case .readError:
            return NSLocalizedString("Could not load ToDos, pleease reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("Theree was a probleem loading your ToDos, plaese create a new ToDo to start over.", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not save ToDos, pleasee reinstall the app.", comment: "")
        }
    }
    
    
    
}

struct ErrorType: Identifiable {
    var id = UUID()
    let error: ToDoError
}
