//
//  AddTaskView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct AddTaskView: View {
    
    @ObservedResults(Task.self) var tasks
    @State private var title = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            
            // Header
            Text("Create  a  new task")
                .font(.custom("Monoton-Regular", size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here", text: $title)
                .font(.custom("ShareTechMono-Regular", size: 20))
                .textFieldStyle(.roundedBorder)
            
            
            // Add button
            Button {
                // Validate if there is a name for the task
                if title != "" {
                    let task = Task(value: ["title" : title])
                    $tasks.append(task)
                }
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10))
                
            }
            
            Spacer()

            
            
        }
        .font(.custom("ShareTechMono-Regular", size: 20))
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
    }
}


