//
//  AddButton.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI

struct AddButton: View {
    
    @State var tabBarIsShowing = false
    @Binding var showAddView: Bool
    
    var body: some View {
        VStack{
            Spacer()
            
            GeometryReader { geo in
                HStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Button {
                            showAddView = true
                        } label: {
                            Image(systemName: "plus.app.fill")
                        }
                        

                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .padding()
                    .frame(width: geo.size.width / 1.5, height: 80)
                    .background(Color.green.opacity(0.2))
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(8)
                    .offset(x: tabBarIsShowing ? 0 : geo.size.width, y: 0)
                    
                    Spacer()
                }
               
            }
            .frame(height: 80)
            
        }
        .onAppear{
            
            withAnimation(.spring(response: 0.55,dampingFraction: 0.5)) {
                tabBarIsShowing = true
            }
        }
        
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        
        AddButton(showAddView: .constant(false))
    }
}
