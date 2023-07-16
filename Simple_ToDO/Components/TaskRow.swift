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
                        .transition(.scale)
                    
                    if completed {
                        ZStack {
                            Circle()
                                .fill(.green)
                                .frame(height: 24)
                                
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                        }
                        .transition(.scale)
                    }
                }
                
                Text(task)
                    .strikethrough(completed)
                    .foregroundColor(.primary)
            }
            
            .animation(.easeIn, value: completed)
        }

       
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Wash dishes", completed: true)
    }
}



