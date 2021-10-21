//
//  ContentView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @ObservedObject private var selectorViewModel = SelectorViewModel()
    
    @State private var isDragging = false
    @State private var gridScale: CGFloat = 1
    @State private var gridOffset: CGSize = .zero
    
    private var screenSize: CGRect {
        UIScreen.main.bounds
    }
    private var isPortrait: Bool {
        verticalSizeClass == .regular
    }
    
    // MARK: - Body
    
    var body: some View {
        
        switch isPortrait {
        case true: portrait
        case false: landscape
        }
    }
    
    // MARK: - View
    
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
    
    private var grid: some View {
        GridView(viewModel: selectorViewModel.gridViewModel)
            .equatable()
            .scaleEffect(gridScale)
            .offset(gridOffset)
            .gesture(selectorViewModel.gridViewModel.asPreview ? nil : swipeGesture)
    }
    
    private var selector: some View {
        SelectorView(viewModel: selectorViewModel)
    }
    
    // MARK: - Gesture
    
    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { value in
                self.isDragging = true
                
                withAnimation(.easeInOut) {
                    self.gridScale = 0.8
                    
                    switch isPortrait {
                    case true: gridOffset = .init(width: .zero,
                                                  height: value.startLocation.y > value.location.y ?
                                                  value.translation.height : .zero)
                    case false: gridOffset = .init(width: value.startLocation.x > value.location.x ?
                                                   value.translation.width : .zero,
                                                   height: .zero)
                    }
                }
            }
            .onEnded { value in
                self.isDragging = false
                withAnimation(.easeInOut) {
                    
                    if value.predictedEndLocation.y < value.startLocation.y - 800 {
                        self.gridOffset.height = -screenSize.height
                        self.gridScale = 1
                    } else if value.predictedEndLocation.x < value.startLocation.x - 800 {
                        self.gridOffset.width = -screenSize.width
                        self.gridScale = 1
                    } else {
                        self.gridOffset = .zero
                        self.gridScale = 1
                    }
                }
            }
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
