//
//  ContentView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var showAddView = false
    @ObservedResults(Task.self) var tasks
    
    var body: some View {
        VStack  {
            if tasks.first != nil {
                ZStack (alignment: .bottomTrailing) {
                    TasksView()
                    AddButton(showAddView: $showAddView)
                        .padding()
                }
            }
            else {
                VStack{
                    Spacer()
                    Text("You don't have any tasks yet")
                    HStack{
                        Text("Press")
                        Button {
                            showAddView = true
                        } label: {
                            Text("here")
                        }
                        Text("to add some")
                    }
                    Spacer()
                }
                .font(.custom("ShareTechMono-Regular", size: 20))
            }
            
        }
        .sheet(isPresented: $showAddView) {
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
