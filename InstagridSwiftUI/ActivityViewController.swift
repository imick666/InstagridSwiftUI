//
//  ActivityViewController.swift
//  InstagridSwiftUI
//
//  Created by mickael ruzel on 26/01/2021.
//

import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let avc = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        return avc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
}
