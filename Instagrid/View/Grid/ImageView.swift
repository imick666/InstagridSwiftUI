//
//  ImageView.swift
//  Instagrid
//
//  Created by mickael ruzel on 27/09/2021.
//

import SwiftUI

struct ImageView: View {
    
    // MARK: - Properties
    
    @State private var showImagePicker = false
    @State private var showSelectSource = false
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State private var sourceType: UIImagePickerController.SourceType?
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geo in
            Group {
                switch image {
                case .none:
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.init("Grey"))
                        .scaleEffect(0.4)
                        .aspectRatio(1, contentMode: .fit)
                case .some(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                self.showSelectSource = true
            }

        }
        .clipped()
        .background(Color(.white))
        .actionSheet(isPresented: $showSelectSource) {
            ActionSheet(title: Text("Select source"), buttons: sourcesButtons())
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(pickedImage: $selectedImage, imageSource: sourceType!)
        }
    }
    
    // MARK: - Methodes
    
    func clear() {
        
    }
    
    private func loadImage() {
        if let uiImage = selectedImage {
            image = Image(uiImage: uiImage)
        }
    }
    
    private func sourcesButtons() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            buttons.append(.default(Text("Camera")) {
                self.sourceType = .camera
                self.showImagePicker = true
            })
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            buttons.append(.default(Text("Photo library")) {
                self.sourceType = .photoLibrary
                self.showImagePicker = true
            })
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            buttons.append(.default(Text("Saved album")) {
                self.sourceType = .savedPhotosAlbum
                self.showImagePicker = true
            })
        }
        
        buttons.append(.cancel())
        
        return buttons
    }
    
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GridView(grid: .layouts[2]) {
                ImageView()
            }
            .background(Color("DeepBlue"))

            GridView(grid: .layouts[0]) {
                Color(.white)
            }
            .background(Color("Grey"))

        }
    }
}
