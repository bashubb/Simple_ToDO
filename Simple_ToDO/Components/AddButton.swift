//
//  AddButton.swift
//  Simple_ToDO
//
//  Created by HubertMac on 14/07/2023.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.blue)
                .frame(width:50)
                
            Text("+")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
        }
        .frame(height: 50)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
