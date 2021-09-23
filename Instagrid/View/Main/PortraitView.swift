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
    
    private let layouts: [GridViewModel] = [
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
            
            SelectorView(data: layouts, selectedIndex: $selectedIndex)
                .frame(height: screenSize.height / 10)
                .padding()
            
        }
        .background(Color("LightBlue").edgesIgnoringSafeArea(.all))
    }
    
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitView()
    }
}
