//
//  GridView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct GridView: View {
    
    // MARK: - Properties
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @ObservedObject var viewModel: GridViewModel
    @State private var frameWidth: CGFloat = .zero
    
    private var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
    private var isPortrait: Bool {
        verticalSizeClass == .regular
    }
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geo in
            Group {
                switch viewModel.orientation {
                case .horizontal: horizontalGrid
                case .vertical: verticalGrid
                }
            }
            .onAppear { self.frameWidth = geo.size.width * 0.04 }
        }
        .padding(frameWidth)
        .background(viewModel.asPreview ? Color(.customGrey) : Color(.deepBlue))
        .aspectRatio(1, contentMode: .fit)
    }
    
    // MARK: - View
    
    private var horizontalGrid: some View {
        VStack(spacing: frameWidth) {
            ForEach(viewModel.imageViews) { rows in
                HStack(spacing: frameWidth) {
                    ForEach(rows) { content in
                        switch content {
                        case .preview: Color.white
                        case .imageViewModel(let viewModel): ImageView(viewModel: viewModel)
                        }
                    }
                }
            }
        }
    }
    
    private var verticalGrid: some View {
        HStack(spacing: frameWidth) {
            ForEach(viewModel.imageViews) { collumns in
                VStack(spacing: frameWidth) {
                    ForEach(collumns) { content in
                        switch content {
                        case .preview: Color.white
                        case .imageViewModel(let viewModel): ImageView(viewModel: viewModel)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Gesture
    

    
    // MARK: - Methodes
    
    
}

extension GridView: Equatable {
    
    static func == (lhs: GridView, rhs: GridView) -> Bool {
        return lhs.viewModel == rhs.viewModel
    }
    
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GridView(viewModel: .init(gridModel: .layouts[2], asPreview: true))
            
            GridView(viewModel: .init(gridModel: .layouts[2]))
        }
        
    }
}
