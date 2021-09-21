//
//  GridViewModel.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import Foundation

enum GridOrientation {
    case horizontal, vertical
}

final class GridViewModel: ObservableObject {
    
    @Published var top: Int
    @Published var bottom: Int
    @Published var orientation: GridOrientation
    
    init(top: Int, bottom: Int, orientation: GridOrientation) {
        self.top  = top
        self.bottom = bottom
        self.orientation = orientation
    }
    
}
