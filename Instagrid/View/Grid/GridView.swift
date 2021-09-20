//
//  GridView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct GridView: View {
    
    var up: Int
    var down: Int
    
    var body: some View {
        GeometryReader { geo in
            let paddingSize = geo.size.width * 0.04
            
            VStack(spacing: paddingSize) {
                HStack(spacing: paddingSize) {
                    ForEach(0 ..< up) { _ in
                        Color(.white)
                    }
                }
                
                HStack(spacing: paddingSize) {
                    ForEach(0 ..< down) { _ in
                        Color(.white)
                    }
                }
            }
            .padding(paddingSize)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(up: 2, down: 2)
            .background(Color("DeepBlue"))
    }
}
