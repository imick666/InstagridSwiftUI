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
            
            createGrid(up: 2, down: 2)
                .padding(.horizontal)
            
            Spacer()
            
            createSelector
                .frame(height: screenSize.height / 8)
                .padding()
            
        }
        .background(Color("LightBlue").edgesIgnoringSafeArea(.all))
    }
    
    private func createGrid(up: Int, down: Int,
                            color: Color = Color("DeepBlue")) -> some View {
        
        GeometryReader { proxy in
            let paddingSize = proxy.size.width * 0.04
            
            VStack(spacing: paddingSize) {
                HStack(spacing: paddingSize) {
                    ForEach(0 ..< up) { _ in
                        Color(.white)
                    }
                }
                HStack(spacing: paddingSize) {
                    ForEach(0 ..< down) { _ in
                        Color(.white)
                    }
                }
            }
            .padding(paddingSize)
        }
        .background(color)
        .aspectRatio(1, contentMode: .fit)
        
    }
    
    private var createSelector: some View {
        let color = Color("Grey")
        
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                createGrid(up: 2, down: 2, color: color)
                    .overlay(
                        Color("MidBlue")
                            .opacity(0.5)
                    )
                createGrid(up: 1, down: 2, color: color)
                createGrid(up: 2, down: 1, color: color)
                createGrid(up: 1, down: 1, color: color)
            }
        }
    }
    
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitView()
    }
}
