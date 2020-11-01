//
//  ContentView.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ToDoListViewModel()
    
    var body: some View {
        List(viewModel.todos) { todo in
            Text(todo.title)
        }.onAppear {
            
            viewModel.getToDoList()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
