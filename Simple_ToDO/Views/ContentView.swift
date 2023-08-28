//
//  ContentView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var showTaskView = false
    @ObservedResults(Task.self) var tasks
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            if tasks.first != nil {
                TasksView()
            }
            AddButton()
                .padding()
                .onTapGesture {
                    showTaskView.toggle()
                }
            
            
        }
        .sheet(isPresented: $showTaskView) {
            AddTaskView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
