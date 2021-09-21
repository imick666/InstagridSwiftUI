//
//  ContentView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        
        switch verticalSizeClass {
        case .regular: PortraitView()
        case .compact: Text("Hello, World!")
        default: Text("WHATS!!!!!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
