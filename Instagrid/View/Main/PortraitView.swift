//
//  PortraitView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct PortraitView: View {
    
    // MARK: - Properties
    
    @State private var isDragging = false
    @ObservedObject private var selectorViewModel = SelectorViewModel()
    
    private var screenSize: CGRect {
        UIScreen.main.bounds
    }
    
    // MARK: - Body
    
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
            
            GridView(viewModel: selectorViewModel.gridViewModel)
                .equatable()
                .padding()
                
            
            Spacer()
            
            SelectorView(viewModel: selectorViewModel)
                .frame(height: screenSize.height / 10)
                .padding()
            
        }
        .background(Color(.lightBlue).edgesIgnoringSafeArea(.all))
    }
    
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitView()
    }
}
