//
//  TasksView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI

struct TasksView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                if !realmManager.tasks.isEmpty {
                    List {
                        ForEach(realmManager.tasks, id: \.id) {task in
                            if !task.isInvalidated {
                                TaskRow(task: task.title, completed: task.completed)
                                    .onTapGesture {
                                        realmManager.updateTask(id: task.id, completed: !task.completed)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            realmManager.getTasks()
                                        }
                                            
                                    
                                    }
                                    .swipeActions(allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            realmManager.deleteTask(id: task.id)
                                        } label: {
                                            Label ("Delete", systemImage: "trash")
                                        }
                                        
                                    }
                            }
                        }
                        .listRowSeparator(.hidden)
                        
                    }
                    
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                
                
            }
            .navigationTitle("My Tasks")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
