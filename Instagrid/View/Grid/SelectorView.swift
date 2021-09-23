//
//  Selector.swift
//  Instagrid
//
//  Created by mickael ruzel on 23/09/2021.
//

import SwiftUI

struct SelectorView: View {
    
    var data: [GridViewModel]
    @Binding var selectedIndex: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0 ..< data.count, id: \.self) { index in
                    
                    Button(action: { selectedIndex = index },
                           label: {
                            GridView(viewModel: data[index])
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

struct Selector_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(data: [
            GridViewModel(top: 2, bottom: 2, orientation: .horizontal),
            GridViewModel(top: 1, bottom: 2, orientation: .horizontal),
            GridViewModel(top: 2, bottom: 1, orientation: .horizontal),
            GridViewModel(top: 1, bottom: 1, orientation: .horizontal),
            GridViewModel(top: 1, bottom: 2, orientation: .vertical),
            GridViewModel(top: 2, bottom: 1, orientation: .vertical),
            GridViewModel(top: 1, bottom: 1, orientation: .vertical)
        ], selectedIndex: .constant(0))
            .frame(height: 80)
    }
}
