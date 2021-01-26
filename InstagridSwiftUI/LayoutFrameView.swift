//
//  LayoutFrameView.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

struct LayoutFrameView: View {
    
    // MARK: - Properties
    var selectedLayout: Int
    var topImagesNumber: Int {
        switch selectedLayout {
        case 2, 3: return 2
        case 1: return 1
        default: return 0
        }
    }
    var bottomImagesNumber: Int {
        switch selectedLayout {
        case 1, 3: return 2
        case 2: return 1
        default: return 0
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                ForEach(0..<topImagesNumber, id: \.self) { _ in
                    ImageButtonView()
                }
            }
            HStack(spacing: 10) {
                ForEach(0..<bottomImagesNumber, id: \.self) { _ in
                    ImageButtonView()
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding(10)
        .background(Color(#colorLiteral(red: 0, green: 0.4034833014, blue: 0.6134039164, alpha: 1)))
    }
}

struct LayoutFrameView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutFrameView(selectedLayout: 1).previewLayout(.sizeThatFits)
    }
}
