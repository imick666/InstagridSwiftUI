//
//  GridViewModel.swift
//  Instagrid
//
//  Created by mickael ruzel on 16/10/2021.
//

import Foundation
import SwiftUI

enum GridContent: Identifiable {
    case imageViewModel(ImageViewModel)
    case preview
    
    var id: UUID {
        UUID()
    }
}

final class GridViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var imageViews = [[GridContent]]()
    private(set) var orientation: GridOrientation = .horizontal
    private(set) var isForPreview: Bool = false
    
    // MARK: - Init
    
    init(gridModel: GridModel, forPreview: Bool = false) {
        self.isForPreview = forPreview
        self.orientation = gridModel.orientation
        
        self.imageViews = forPreview ?
        [
            Array(repeating: .preview, count: gridModel.top),
            Array(repeating: .preview, count: gridModel.bottom)
        ] :
        createImageViewModels(groups: [gridModel.top, gridModel.bottom])
        
    }
    
    // MARK: - Methodes
    
    public func clearAllImages() {
        
    }
    
    private func createImageViewModels(groups: [Int]) -> [[GridContent]] {
        var result = [[GridContent]]()
        
        groups.forEach { group in
            var subGroup = [GridContent]()
            
            for _ in 0 ..< group { subGroup.append(.imageViewModel(.init())) }
            
            result.append(subGroup)
        }
        
        return result
    
    }
    
    
    
    
}
