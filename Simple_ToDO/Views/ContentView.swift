//
//  ContentView.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @State private var introShowing = false
    @State private var showAddView = false
    
    @ObservedResults(Task.self) var tasks
    
    var body: some View {
        ZStack {
            VStack  {
                if tasks.first != nil {
                    ZStack (alignment: .bottomTrailing) {
                        TasksView()
                        TabBarView(showAddView: $showAddView)
                            .padding()
                    }
                }
                else {
                    NoTasksView(showAddView: $showAddView)
                }
                
            }
            .sheet(isPresented: $showAddView) {
                AddTaskView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(Color(hue: 0.481, saturation: 0.03, brightness: 0.884))
            
            
            ZStack{
                Rectangle()
                    .offset(x: introShowing ? -1000 : 0 , y: 0)
                    .animation(.easeOut(duration: 1.2).delay(1.5), value: introShowing)
                Rectangle()
                    .offset(x: introShowing ? 1000 : 0 , y: 0)
                    .animation(.easeOut(duration: 1.2).delay(1.5), value: introShowing)

                
                Text("Simple    TODO")
                    .foregroundColor(.white)
                    .font(Font.custom("Monoton-Regular", size: 60))
                    .scaleEffect(introShowing ? 0 : 1)
                    .rotationEffect(.degrees(introShowing ? 360 : 0))
                    .opacity(introShowing ? 0 : 1)
                    .animation(.default.speed(0.5), value: introShowing)
            }
            .ignoresSafeArea()
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                introShowing = true
            }
        }
    }
}



struct NoTasksView: View {
    @Binding var showAddView: Bool
    var body: some View {
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
