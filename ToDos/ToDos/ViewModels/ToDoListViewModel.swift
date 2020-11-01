//
//  ToDoListViewModel.swift
//  ToDos
//
//  Created by Aaron Lee on 2020-11-01.
//

import Foundation
import Combine

final class ToDoListViewModel: ObservableObject, ToDoService {
    var apiSession: APIService
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var todos = [ToDo]()
    
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getToDoList() {
        
        let cancellable = self.getToDoList()
            .sink { result in
                switch result {
                case .failure(let error):
                    print("Handle the error: \(error)")
                case .finished:
                    break
                }
            } receiveValue: { todos in
                self.todos = todos
                
            }
        
        cancellables.insert(cancellable)
        
    }
    
    
}
