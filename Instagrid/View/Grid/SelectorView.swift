//
//  Selector.swift
//  Instagrid
//
//  Created by mickael ruzel on 23/09/2021.
//

import SwiftUI

struct SelectorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: SelectorViewModel
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom) {
                ForEach(viewModel.gridModels) { gridModel in
                    
                    Button(action: { self.viewModel.selectGrid(gridModel) },
                           label: {
                        
                        GridView(viewModel: .init(gridModel: gridModel, asPreview: true))
                            .overlay(
                                Color("MidBlue")
                                    .opacity(
                                        (gridModel == viewModel.selectedGrid) ? 0.4 : 0
                                    )
                            )
                    })
                }
            }
        }
    }
}

struct Selector_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(viewModel: .init())
            .frame(height: 80)
    }
}
