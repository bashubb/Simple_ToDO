//
//  TaskRow.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct TaskRow: View {
    
    @ObservedRealmObject var task: Task
    
    var body: some View {
        
        
        Toggle(task.title, isOn: $task.completed)
            .toggleStyle(CheckToggleStyle())
            .font(.custom("ShareTechMono-Regular", size: 20))
            .foregroundColor(.primary)
            .padding(.vertical, 10)
    }
}


struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label : {
            Label {
                configuration.label
                    .strikethrough(configuration.isOn, pattern: .solid, color: Color.red)
                    .scaleEffect(x: 1 ,y: configuration.isOn ? -1 : 1 )
                    .animation(.default.repeatCount(2).delay(1).speed(3), value: configuration.isOn)
                    .scaleEffect(x: 1 ,y: configuration.isOn ? -1 : 1 )
                    .animation(.default.repeatCount(2).delay(1.2).speed(3), value: configuration.isOn)
                    
                
            } icon : {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 1.5)
                        .frame(height: 25)
                    //First set of animation changes
                        .scaleEffect(configuration.isOn ? 2 : 1)
                        .animation(.easeOut(duration: 1).delay(0.5), value: configuration.isOn)
                    
                    //Secondnset of animation changes
                        .scaleEffect(configuration.isOn ? 0.5 : 1)
                        .animation(.easeIn.delay(1.5).speed(2), value: configuration.isOn)
                        .background(Circle()
                            .fill(configuration.isOn ? Color.green : Color.white)
                            .scaleEffect(configuration.isOn ? 1 : 0))
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .opacity(configuration.isOn ? 1 : 0)
                        .scaleEffect(configuration.isOn ? 0.8 : 0.3)
                        .animation(.spring().delay(0.8) , value: configuration.isOn)
                }
                .animation(.default, value: configuration.isOn)
                
            }
        }
        .buttonStyle(.plain)
    }
    
}





