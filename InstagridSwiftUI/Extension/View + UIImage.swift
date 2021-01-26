//
//  View + UIImage.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

extension View {
    func asImage(rect: CGRect) -> UIImage? {
        let image = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: rect)
        print(image)
        return image
    }
}
