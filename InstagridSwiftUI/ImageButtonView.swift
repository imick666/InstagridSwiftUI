//
//  ImageButtonView.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

struct ImageButtonView: View {
    
    // MARK: - State Properties
    
    @State var image: UIImage?
    @State var pickerIsShow = false
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            ZStack {
                Color(.white)
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Button(action: {
                        pickerIsShow.toggle()
                    }, label: {
                        Image("Plus")
                    })
                }
            }
            .frame(width: size.width, height: size.height, alignment: .center)
            .clipped()
            .popover(isPresented: $pickerIsShow, content: {
                ImagePickerController(image: $image)
            })
        }
    }
}

struct ImageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ImageButtonView().previewLayout(.sizeThatFits)
    }
}
