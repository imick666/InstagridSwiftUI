//
//  Selector.swift
//  Instagrid
//
//  Created by mickael ruzel on 23/09/2021.
//

import SwiftUI

struct SelectorView: View {
    
    // MARK: - Properties
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @ObservedObject var viewModel: SelectorViewModel
    
    private var screenSize: CGRect {
        UIScreen.main.bounds
    }
    private var isPortrait: Bool {
        verticalSizeClass == .regular
    }
    
    // MARK: - Body
    
    var body: some View {
        switch isPortrait {
        case true: portrait
        case false: landscape
        }
    }
    
    private var portrait: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom) {
                ForEach(viewModel.gridModels) { gridModel in
                    
                    Button(action: { self.viewModel.selectGrid(gridModel) },
                           label: {
                        
                        GridView(viewModel: .init(gridModel: gridModel, asPreview: true))
                            .overlay(
                                Color(.midBlue)
                                    .opacity(
                                        (gridModel == viewModel.selectedGrid) ? 0.4 : 0
                                    )
                            )
                    })
                }
            }
            .frame(maxHeight: screenSize.height / 10)
        }
    }
    
    private var landscape: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                ForEach(viewModel.gridModels) { gridModel in
                    
                    Button(action: { self.viewModel.selectGrid(gridModel) },
                           label: {
                        
                        GridView(viewModel: .init(gridModel: gridModel, asPreview: true))
                            .overlay(
                                Color(.midBlue)
                                    .opacity(
                                        (gridModel == viewModel.selectedGrid) ? 0.4 : 0
                                    )
                            )
                    })
                }
            }
            .frame(maxWidth: screenSize.width / 10)
        }
    }
    
}

struct Selector_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(viewModel: .init())
        
        SelectorView(viewModel: .init())
            .environment(\.verticalSizeClass, .compact)
    }
}
