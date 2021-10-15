//
//  ImageViewModel.swift
//  Instagrid
//
//  Created by mickael ruzel on 15/10/2021.
//

import Foundation
import UIKit
import Combine

final class ImageViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var selectedImage: Data? = nil
    @Published var imageIsEmpty = true
    @Published var showSourceSelector = false
    @Published var showPicker = false
    @Published var pickerSource: UIImagePickerController.SourceType? = nil
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init() {
        $selectedImage
            .map { $0 == nil }
            .assign(to: \.imageIsEmpty, on: self)
            .store(in: &subscriptions)
        
        $pickerSource
            .map { $0 != nil }
            .assign(to: \.showPicker, on: self)
            .store(in: &subscriptions)
    }
    
    // MARK: - Methodes
    
    func clearImage() {
        selectedImage = nil
    }
    
}
