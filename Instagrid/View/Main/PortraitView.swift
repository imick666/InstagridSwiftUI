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
    
    private let layouts: [GridModel] = GridModel.layouts
    
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
            
            GridView(grid: layouts[selectedIndex]) {
                ImageView()
            }
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
