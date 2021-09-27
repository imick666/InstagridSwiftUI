//
//  Selector.swift
//  Instagrid
//
//  Created by mickael ruzel on 23/09/2021.
//

import SwiftUI

struct SelectorView: View {
    
    var data: [GridModel]
    @Binding var selectedIndex: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0 ..< data.count, id: \.self) { index in
                    
                    Button(action: { selectedIndex = index },
                           label: {
                            GridView(grid: data[index])
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
        SelectorView(data: GridModel.layouts, selectedIndex: .constant(0))
            .frame(height: 80)
    }
}
