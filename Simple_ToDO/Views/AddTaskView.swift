//
//  AddTaskView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            
            Text("Create a new taks")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title)
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
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
