//
//  PortraitView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct PortraitView: View {
    
    // MARK: - Properties
    
    @State private var selectedIndex = 0
    
    private var layouts: [GridViewModel] = [
        GridViewModel(top: 2, bottom: 2, orientation: .horizontal),
        GridViewModel(top: 1, bottom: 2, orientation: .horizontal),
        GridViewModel(top: 2, bottom: 1, orientation: .horizontal),
        GridViewModel(top: 1, bottom: 1, orientation: .horizontal),
        GridViewModel(top: 1, bottom: 2, orientation: .vertical),
        GridViewModel(top: 2, bottom: 1, orientation: .vertical),
        GridViewModel(top: 1, bottom: 1, orientation: .vertical)
    ]
    
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
            
            GridView(viewModel: layouts[selectedIndex])
                .background(Color("DeepBlue"))
                .padding()
            
            Spacer()
            
            createSelector
                .frame(height: screenSize.height / 10)
                .padding()
            
        }
        .background(Color("LightBlue").edgesIgnoringSafeArea(.all))
    }
    
    // MARK: - Views
    
    private var createSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0 ..< layouts.count, id: \.self) { index in
                    
                    Button(action: { selectedIndex = index },
                           label: {
                            GridView(viewModel: layouts[index])
                                .background(Color("Grey"))
                                .overlay(
                                    Color("MidBlue")
                                        .opacity(
                                            (index == selectedIndex) ? 0.4 : 0
                                        )
                                )
                    })
                    
                }
            }
        }
    }
    
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitView()
    }
}
