//
//  LayoutFrameView.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

struct LayoutFrameView: View {
    
    // MARK: - Properties
    var topImagesNumber: Int
    var bottomImagesNumber: Int
    
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
        LayoutFrameView(topImagesNumber: 1, bottomImagesNumber: 2).previewLayout(.sizeThatFits)
    }
}
