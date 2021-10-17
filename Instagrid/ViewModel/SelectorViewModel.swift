//
//  SelectorViewModel.swift
//  Instagrid
//
//  Created by mickael ruzel on 16/10/2021.
//

import Foundation
import Combine

final class SelectorViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var gridModels = [GridModel]()
    @Published private(set) var selectedGrid: GridModel
    @Published private(set) var gridViewModel: GridViewModel!
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    
    init() {
        self.gridModels = GridModel.layouts
        self.selectedGrid = GridModel.layouts[0]
        
        $selectedGrid
            .map { GridViewModel(gridModel: $0) }
            .assign(to: \.gridViewModel, on: self)
            .store(in: &subscriptions)
    }
    
    // MARK: - Methodes
    
    func selectGrid(_ gridModel: GridModel) {
        selectedGrid = gridModel
    }
}
