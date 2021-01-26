//
//  ImageButtonView.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

struct ImageButtonView: View {
    @State var image: Image?
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                Color(.white)
                if image != nil {
                    image
                } else {
                    Image("Plus")
                }
            }
        })
    }
}

struct ImageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ImageButtonView().previewLayout(.sizeThatFits)
    }
}
