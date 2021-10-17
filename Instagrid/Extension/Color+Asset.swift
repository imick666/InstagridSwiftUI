//
//  Color+Asset.swift
//  Instagrid
//
//  Created by mickael ruzel on 17/10/2021.
//

import Foundation
import SwiftUI

enum AssetColor: String {
    case deepBlue = "DeepBlue"
    case customGrey = "Grey"
    case lightBlue = "LightBlue"
    case midBlue = "MidBlue"
}


extension Color {
      
    init(_ assetColor: AssetColor) {
        self = Color("\(assetColor.rawValue)")
    }
}
