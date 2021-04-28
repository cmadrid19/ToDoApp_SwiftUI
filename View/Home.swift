//
//  Home.swift
//  ToDo
//
//  Created by Maxim Macari on 20/4/21.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var dataStore: DataStore
    @State private var modalType: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.toDos.value) { toDo in
                    Button(action: {
                        modalType = .update(toDo)
                    }, label: {
                        Text("\(toDo.name)")
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    })
                }
                .onDelete(perform: { indexSet in
                    dataStore.deleteToDo.send(indexSet)
                })
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar(content: {
                ToolbarItem(placement: .principal){
                    Text("My ToDos")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        modalType = .new
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            })
        }
        .sheet(item: $modalType) { $0 }
        .alert(item: $dataStore.appError.value) { (appError) in
            Alert(title: Text("Error")
                    .foregroundColor(Color.red)
                    .fontWeight(.semibold)
                  , message: Text("\(appError.error.localizedDescription)"))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(DataStore())
    }
}
