//
//  PortraitView.swift
//  Instagrid
//
//  Created by mickael ruzel on 20/09/2021.
//

import SwiftUI

struct PortraitView: View {
    
    // MARK: - Properties
    
    @State private var selectedIndex = 0
    @State private var gridYOffset: CGFloat = .zero
    @State private var gridScale: CGFloat = 1
    @State private var isDragging = false
    @ObservedObject private var selectorViewModel = SelectorViewModel()
    
    // For Tests
    @State private var showAlert = false
    
    
    private var screenSize: CGRect {
        UIScreen.main.bounds
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text("Instagrid")
                .font(.custom("ThirstySoftRegular", size: 46))
                .foregroundColor(.white)
            
            Spacer()
            
            VStack {
                Image(systemName: "chevron.up")
                Text("Swipe up to share")
                    .font(.custom("Delm-Medium", size: 24))
                    .padding(.top)
            }
            .foregroundColor(.white)
            .scaleEffect(isDragging ? 0.8 : 1)
            .animation(
                isDragging ?
                    .easeInOut(duration: 0.8).repeatForever(autoreverses: true) :
                    .easeIn(duration: 0.4)
            )
            
            GridView(grid: selectorViewModel.selectedGrid!) {
                ImageView(viewModel: .init())
            }
                .background(Color("DeepBlue"))
                .padding()
                .offset(x: 0, y: gridYOffset)
                .scaleEffect(gridScale)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged { value in
                            self.isDragging = true
                            withAnimation(.easeInOut) {
                                self.gridScale = 0.8
                                guard value.location.y < value.startLocation.y else { return }
                                self.gridYOffset = value.translation.height
                            }
                            
                        }
                        .onEnded { value in
                            self.isDragging = false
                            withAnimation(.easeInOut) {

                                if value.predictedEndLocation.y < value.startLocation.y - 800 {
                                    self.gridYOffset = -screenSize.height
                                    self.gridScale = 1
                                    self.showAlert.toggle()
                                } else {
                                    self.gridYOffset = .zero
                                    self.gridScale = 1
                                }
                            }
                            
                            print("start location : \(value.startLocation.y)")
                            print("predicted location : \(value.predictedEndLocation.y)")
                        }
                )
            
            Spacer()
            
            SelectorView(viewModel: selectorViewModel)
                .frame(height: screenSize.height / 10)
                .padding()
            
        }
        .background(Color("LightBlue").edgesIgnoringSafeArea(.all))
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Done"),
                  message: Text("Show sharing view"),
                  dismissButton: .cancel {
                
                
                self.gridYOffset = .zero
                self.gridScale = 0
                
                withAnimation {
                    self.gridScale = 1
                }
            })
        }
    }
    
}

struct PortraitView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitView()
    }
}
