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
        
            VStack(spacing:0) {
                HStack {
                    Text("My   tasks")
                        .font(Font.custom("Monoton-Regular", size: 40))
                        .padding(8)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.1))
                    
                    
                }
                    
                
                if !realmManager.tasks.isEmpty {
                    List {
                        ForEach(realmManager.tasks, id: \.id) {task in
                            if !task.isInvalidated {
                                TaskRow(task: task.title, completed: task.completed)
                                    .listRowBackground(Color.clear)
                                    .onTapGesture {
                                        realmManager.updateTask(id: task.id, completed: !task.completed)
                                        realmManager.getTasks()
                                        
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
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
            
        
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
