//
//  GridView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct GridView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: GridViewModel
    @State private var frameWidth: CGFloat = .zero
    
    @State private var isDragging = false
    @State private var gridScale: CGFloat = 1
    @State private var gridYOffset: CGFloat = .zero
    
    private var screenSize: CGSize {
        UIScreen.main.bounds.size
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
        .scaleEffect(gridScale)
        .offset(y: gridYOffset)
        .gesture(viewModel.asPreview ? nil : swipeGesture)
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
    
    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                .onChanged { value in
                                    self.isDragging = true
                                    withAnimation(.easeInOut) {
                                        self.gridScale = 0.8
                                        guard value.location.y < value.startLocation.y else { return }
                                        self.gridYOffset = value.translation.height
                                    }
                                    
                                }
                                .onEnded { value in
                                    self.isDragging = false
                                    withAnimation(.easeInOut) {

                                        if value.predictedEndLocation.y < value.startLocation.y - 800 {
                                            self.gridYOffset = -screenSize.height
                                            self.gridScale = 1
                                        } else {
                                            self.gridYOffset = .zero
                                            self.gridScale = 1
                                        }
                                    }
                                }
    }
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
