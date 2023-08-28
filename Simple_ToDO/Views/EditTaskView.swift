//
//  EditTaskView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 28/08/2023.
//

import SwiftUI
import RealmSwift

struct EditTaskView: View {
    
    @ObservedRealmObject var task: Task
    @Binding var selectedTaskId: ObjectId!
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            
            Text("Update  the   task")
                .font(.custom("Monoton-Regular", size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here", text: $task.title)
                .font(.custom("ShareTechMono-Regular", size: 20))
                .textFieldStyle(.roundedBorder)
            
            Button {
                dismiss()
                selectedTaskId = nil
            } label: {
                Text("Save")
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

