//
//  ContentView.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - State Properties
    
    @State var selectedLayout = 1
    
    // MARK: - Body

    var body: some View {
        VStack {
            Text("Instagrid")
                .font(.custom("ThirstySoftRegular", size: 42))
                .foregroundColor(.white)
            Spacer()
            VStack {
                Image("Arrow Up")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                Text("Swipe up to share")
                    .font(.custom("Delm-Medium", size: 24))
                    .foregroundColor(.white)
            }
            
            switch selectedLayout {
            case 1: LayoutFrameView(topImagesNumber: 1, bottomImagesNumber: 2)
            case 2: LayoutFrameView(topImagesNumber: 2, bottomImagesNumber: 1)
            case 3: LayoutFrameView(topImagesNumber: 2, bottomImagesNumber: 2)
            default: LayoutFrameView(topImagesNumber: 0, bottomImagesNumber: 0)
            }
            
            Spacer()
            
            LayoutSelectorView(selectedLayout: $selectedLayout)
            
        }
        .background(Color(#colorLiteral(red: 0.6802163124, green: 0.835055232, blue: 0.8933518529, alpha: 1)).edgesIgnoringSafeArea(.all))
    }
    
    // MARK: - Methodes
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
