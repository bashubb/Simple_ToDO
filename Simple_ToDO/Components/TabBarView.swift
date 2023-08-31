//
//  AddButton.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct TabBarView: View {
    
    @ObservedResults(Task.self, where: ( { $0.completed == false } )) var tasksToDo
    @Binding var showAddView: Bool
    @State var isTabBarShowing = false
    @State var isChevronRotate = false
    
    
    var body: some View {
        VStack{
            
            Spacer()
            
            GeometryReader { geo in
                HStack {
                    Spacer()
                    
                    // Tab bar
                    HStack(spacing: 0) {
                        
                        //Chevron rotating button - sliding tab bar effect
                        Button {
                            withAnimation(.spring(response: 0.55,dampingFraction: 0.5).delay(0.3)) {
                                isTabBarShowing.toggle()
                            }
                            withAnimation(.spring(response: 0.55,dampingFraction: 0.5).delay(0.5)) {
                                isChevronRotate.toggle()
                            }
                        } label: {
                            Image(systemName: "chevron.left.2")
                                .rotationEffect(.degrees(isChevronRotate ? 180 : 0 ))
                                .padding(.leading, 5)
                        }
                        
                        Spacer()
                        
                        // Add Task button
                        Button {
                            showAddView = true
                        } label: {
                            Image(systemName: "plus.app.fill")
                        }
                        
                        Spacer()
                        
                        // Share button
                        ShareLink(items: fetchTasks(tasks: tasksToDo),
                                  subject: Text("TO DO List"))
                        {
                            Image(systemName: "square.and.arrow.up")
                        }
                        
                        Spacer()
                        
                    }
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .frame(width: geo.size.width / 1.5, height: 80)
                    .background(Color.green.opacity(0.2))
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(8)
                    .offset(x: isTabBarShowing ? 0 : geo.size.width - 120, y: 0)
                    
                    Spacer()
                }
                
            }
            .frame(height: 80)
            
        }
        .onAppear{
            
            // Slide tab bar on side on the view appear
            withAnimation(.spring(response: 0.55,dampingFraction: 0.5).delay(0.8)) {
                isTabBarShowing.toggle()
            }
            withAnimation(.spring(response: 0.55,dampingFraction: 0.5).delay(1)) {
                isChevronRotate.toggle()
            }
        }
        
    }
    
    
    
    /// Prepare list of tasks for sharing
    func fetchTasks(tasks: Results<Task>) -> [String] {
        
        var tasksTODO = [String]()
        
        for task in tasks {
            tasksTODO.append("• \(task.title)")
        }
        print(tasksTODO)
        return tasksTODO
    }
}




