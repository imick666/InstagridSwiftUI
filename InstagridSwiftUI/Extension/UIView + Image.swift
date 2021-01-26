//
//  UIView + Image.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

extension UIView {
    func asImage(rect: CGRect) -> UIImage? {
        print(rect)
        let render = UIGraphicsImageRenderer(bounds: rect)
        return render.image { (context) in
            layer.render(in: context.cgContext)
        }
    }
    
}
