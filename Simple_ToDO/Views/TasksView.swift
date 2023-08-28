//
//  TasksView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct TasksView: View {
    
    @ObservedResults(Task.self) var tasks
    
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
                    
                    List {
                        ForEach(tasks, id: \.id) {task in
                                TaskRow(task: task)
                                    .listRowBackground(Color.clear)

                        }
                        .onDelete(perform: $tasks.remove)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
            
        
        
    }
}

//struct TasksView_Previews: PreviewProvider {
//    static var previews: some View {
//        TasksView()
//            
//    }
//}
