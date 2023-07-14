//
//  ContentView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showTaskView = false
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            
            TasksView()
            
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
        .background(Color(red: 0.838, green: 0.747, blue: 0.669))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
