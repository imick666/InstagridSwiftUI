//
//  LayoutSelectorView().swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

struct LayoutSelectorView: View {
    
    // MARK: - Binding Properties
    
    @Binding var selectedLayout: Int
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ForEach(1..<4) { int in
                Spacer()
                Button(action: {
                    selectedLayout = int
                }, label: {
                    ZStack {
                        Image("Layout \(int)")
                            .resizable()
                        if selectedLayout == int {
                            Image("Selected")
                                .resizable()
                        }
                    }
                    .frame(width: 80, height: 80, alignment: .center)
                })
            }
            Spacer()
        }
    }
}

struct LayoutSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutSelectorView(selectedLayout: .constant(1)).previewLayout(.sizeThatFits)
    }
}
