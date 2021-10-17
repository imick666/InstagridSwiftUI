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
    private(set) var asPreview: Bool
    
    private var grid: [Int]
    
    // MARK: - Init
    
    init(gridModel: GridModel, asPreview: Bool = false) {
        self.orientation = gridModel.orientation
        self.grid = [gridModel.top, gridModel.bottom]
        self.asPreview = asPreview
        
        self.imageViews = asPreview ? setAsPreview() : setAsImageGrid()
    }
    
    // MARK: - Methodes
    
    public func clearAllImages() {
        
    }
    
    private func setAsPreview() -> [[GridContent]] {
        [
            Array(repeating: .preview, count: grid[0]),
            Array(repeating: .preview, count: grid[1])
        ]
    }
    
    private func setAsImageGrid() -> [[GridContent]] {
        var result = [[GridContent]]()
        
        grid.forEach { group in
            var subGroup = [GridContent]()
            
            for _ in 0 ..< group { subGroup.append(.imageViewModel(.init())) }
            
            result.append(subGroup)
        }
        
        return result
    }
}

extension GridViewModel: Equatable {
    static func == (lhs: GridViewModel, rhs: GridViewModel) -> Bool {
        return lhs.grid == rhs.grid && lhs.orientation == rhs.orientation
    }
}
