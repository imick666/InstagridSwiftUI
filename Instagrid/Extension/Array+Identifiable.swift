//
//  Array+Identifiable.swift
//  Instagrid
//
//  Created by mickael ruzel on 16/10/2021.
//

import Foundation

extension Array: Identifiable {
    
    public var id: UUID {
        UUID()
    }
}
