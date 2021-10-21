//
//  ContentView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @ObservedObject private var selectorViewModel = SelectorViewModel()
    
    private var isPortrait: Bool {
        verticalSizeClass == .regular
    }
    
    var body: some View {
        
        switch isPortrait {
        case true: portrait
        case false: landscape
        }
    }
    
    private var portrait: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: 50) {
                    title
                    swipeText
                }
                Spacer()
                selector
            }
            grid
            
        }
        .padding()
        .background(Color(.lightBlue).edgesIgnoringSafeArea(.all))
    }
    
    private var landscape: some View {
        ZStack {
            HStack(spacing: 0) {
                ZStack {
                    VStack(spacing: 0) {
                        title
                        Spacer()
                    }
                    swipeText
                }
                Spacer()
                selector
            }
            grid
        }
        .padding([.top, .bottom])
        .background(Color(.lightBlue).edgesIgnoringSafeArea(.all))
    }
    
    private var title: Text {
        Text("Instagrid")
            .font(.custom("ThirstySoftRegular", size: 46))
            .foregroundColor(.white)
    }
    
    private var swipeText: some View {
        VStack(spacing: 8) {
            let direction = isPortrait ? "up" : "left"
            Image(systemName: "chevron.\(direction)")
            Text("Swipe \(direction) to share")
                .font(.custom("Delm-Medium", size: 24))
        }
        .foregroundColor(.white)
    }
    
    private var grid: GridView {
        GridView(viewModel: selectorViewModel.gridViewModel)
    }
    
    private var selector: SelectorView {
        SelectorView(viewModel: selectorViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
        HomeView()
            .previewLayout(.fixed(width: 844, height: 390))
            .environment(\.verticalSizeClass, .compact)
    }
}
