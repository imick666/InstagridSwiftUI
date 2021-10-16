//
//  SelectorViewModel.swift
//  Instagrid
//
//  Created by mickael ruzel on 16/10/2021.
//

import Foundation

final class SelectorViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var gridModels = [GridModel]()
    @Published private(set) var selectedGrid: GridModel? = nil
    
    // MARK: - Init
    
    init() {
        self.gridModels = GridModel.layouts
        self.selectedGrid = self.gridModels[0]
    }
    
    // MARK: - Methodes
    
    func selectGrid(_ gridModel: GridModel) {
        selectedGrid = gridModel
    }
}
