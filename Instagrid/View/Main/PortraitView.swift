//
//  PortraitView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct PortraitView: View {
    
    private var screenSize: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        VStack {
            Text("Instagrid")
                .font(.custom("ThirstySoftRegular", size: 46))
                .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                Image(systemName: "chevron.up")
                Text("Swipe up to share")
                    .font(.custom("Delm-Medium", size: 24))
                    .padding(.top)
            }
            .foregroundColor(.white)
            
            GridView(up: 2, down: 2)
                .background(Color("DeepBlue"))
                .padding(.horizontal)
            
            Spacer()
            
            createSelector
                .frame(height: screenSize.height / 8)
                .padding()
            
        }
        .background(Color("LightBlue").edgesIgnoringSafeArea(.all))
    }
    
    private var createSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                GridView(up: 2, down: 2)
                    .background(Color("Grey"))
                    .overlay(
                        Color("MidBlue")
                            .opacity(0.5)
                    )
                GridView(up: 2, down: 1)
                    .background(Color("Grey"))
                GridView(up: 1, down: 2)
                    .background(Color("Grey"))
                GridView(up: 1, down: 1)
                    .background(Color("Grey"))
            }
        }
    }
    
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitView()
    }
}
