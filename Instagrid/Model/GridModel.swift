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

struct GridModel {

    var top: Int
    var bottom: Int
    var orientation: GridOrientation
    
}

extension GridModel {
    static let layouts: [GridModel] = [
        GridModel(top: 2, bottom: 2, orientation: .horizontal),
        GridModel(top: 1, bottom: 2, orientation: .horizontal),
        GridModel(top: 2, bottom: 1, orientation: .horizontal),
        GridModel(top: 1, bottom: 1, orientation: .horizontal),
        GridModel(top: 1, bottom: 2, orientation: .vertical),
        GridModel(top: 2, bottom: 1, orientation: .vertical),
        GridModel(top: 1, bottom: 1, orientation: .vertical)
    ]
}
