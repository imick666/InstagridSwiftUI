//
//  ImageView.swift
//  Instagrid
//
//  Created by mickael ruzel on 27/09/2021.
//

import SwiftUI

struct ImageView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: ImageViewModel
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geo in
            Group {
                if let imageData = viewModel.selectedImage, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                } else {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.init(.midBlue))
                        .scaleEffect(0.4)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                self.viewModel.showSourceSelector = true
            }

        }
        .clipped()
        .background(Color(.white))
        .actionSheet(isPresented: $viewModel.showSourceSelector) {
            ActionSheet(title: Text("Select source"), buttons: getPickerSource())
        }
        .sheet(isPresented: $viewModel.showPicker, onDismiss: { }) {
            ImagePicker(pickedImage: $viewModel.selectedImage, imageSource: viewModel.pickerSource!)
        }
    }
    
    // MARK: - Methodes
    
    private func getPickerSource() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            buttons.append(.default(Text("Camera")){
                self.viewModel.pickerSource = .camera
            })
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            buttons.append(.default(Text("Photo library")){
                self.viewModel.pickerSource = .photoLibrary
            })
        }
        
        if !viewModel.imageIsEmpty {
            buttons.append(.destructive(Text("Remove Image"), action: { viewModel.clearImage() }))
        }
        
        buttons.append(.cancel())
        
        return buttons
        
    }
    
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GridView(viewModel: .init(gridModel: .layouts[2]))
        }
    }
}
