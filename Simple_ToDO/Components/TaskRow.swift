//
//  TaskRow.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI

struct TaskRow: View {
    
    var task:String
    var completed: Bool
    
    
    var body: some View {
        
        Button {
            
        } label: {
            
            HStack (spacing: 20) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 1.5)
                        .frame(height: 25)
                        .background(Circle()
                            .fill(completed ? Color.green : Color.white)
                            .scaleEffect(completed ? 1 : 0))
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .opacity(completed ? 1 : 0)
                        .scaleEffect(completed ? 1 : 0.3)
                        .animation(.easeInOut(duration: 0.4).delay(0.3) , value: completed)
                    
                }
                
                Text(task)
                    .font(.custom("ShareTechMono-Regular", size: 25))
                    .strikethrough(completed)
                    .foregroundColor(.primary)
            }
            
            .animation(.default, value: completed)
        }
        .padding(.vertical, 10)
        
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}



