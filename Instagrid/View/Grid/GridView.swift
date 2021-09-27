//
//  GridView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct GridView: View {
    
    // MARK: - Properties
    
    var grid: GridModel
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geo in
            let padding = geo.size.width * 0.04
            
            switch grid.orientation {
            case .horizontal: horizontalGrid(padding: padding)
            case .vertical: verticalGrid(padding: padding)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    // MARK: - Methodes
    
    private func horizontalGrid(padding: CGFloat) -> some View {
        VStack(spacing: padding) {
            HStack(spacing: padding) {
                ForEach(0 ..< grid.top, id: \.self) { _ in
                    Color(.white)
                }
            }
            
            HStack(spacing: padding) {
                ForEach(0 ..< grid.bottom, id: \.self) { _ in
                    Color(.white)
                }
            }
        }
        .padding(padding)
    }
    
    private func verticalGrid(padding: CGFloat) -> some View {
        HStack(spacing: padding) {
            VStack(spacing: padding) {
                ForEach(0 ..< grid.top, id: \.self) { _ in
                    Color(.white)
                }
            }
            
            VStack(spacing: padding) {
                ForEach(0 ..< grid.bottom, id: \.self) { _ in
                    Color(.white)
                }
            }
        }
        .padding(padding)
        
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(grid: GridModel.layouts[0])
            .background(Color("DeepBlue"))
    }
}
