//
//  TasksView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct TasksView: View {
    
    @ObservedResults(Task.self, sortDescriptor:SortDescriptor(keyPath: "completed", ascending: true) ) var tasks
    
    @State private var showEditView = false
    @State private var selectedTaskID: ObjectId?
    
    var body: some View {
        
            VStack(spacing:0) {
                
                // Header
                HStack {
                    Text("My   tasks")
                        .font(Font.custom("Monoton-Regular", size: 40))
                        .padding(8)
                        .padding(.horizontal)
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.black.opacity(0.1))
                    
                //List of tasks
                    List {
                        ForEach(tasks, id: \.id) {task in
                                TaskRow(task: task)
                                    .listRowBackground(Color.clear)
                                    .swipeActions(allowsFullSwipe: true) {
                                        // Remove task
                                        Button {
                                                $tasks.remove(task)
                                        } label: {
                                            Image(systemName: "xmark")
                                        }
                                        .tint(Color.red.opacity(0.9))
                                        
                                        //Edit task
                                        Button {
                                            selectedTaskID = task.id
                                            showEditView = true
                                        } label: {
                                            Text("Edit")
                                        }
                                        .tint(.yellow.opacity(0.9))
                                       


                                    }

                        }
                        
                    }
                    .animation(.easeInOut(duration: 1.2).delay(0.5), value: tasks)
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                
                
                
            }
            .sheet(isPresented: $showEditView, content: {
                // Trigger for EditTaskView screen
                if let id = selectedTaskID {
                    EditTaskView(task: tasks[tasks.firstIndex(where: { task in task.id == id})!], selectedTaskId: $selectedTaskID)
                }
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
            
        
        
    }
}


