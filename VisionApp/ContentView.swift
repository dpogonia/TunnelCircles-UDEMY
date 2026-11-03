//
//  ContentView.swift
//  VisionApp
//
//  Created by Dmitrii Pogonia on 28.06.2024.
//

import SwiftUI


struct ContentView: View {
    @State private var colors: [Color] = [.cyan, .blue]
    @State private var depth = 50.0
    
    let minDiameter = 50.0
    let diameterChange = 70.0
    
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Tunnel of Circles")
                .font(.largeTitle)
                .padding()
            ZStack {
                ForEach(0..<4) { index in
                    Circle()
                        .stroke(lineWidth: 30)
                        .foregroundStyle(colors[index % 2])
                        .frame(height: minDiameter + diameterChange * Double(index))
                        .padding3D(.back, depth)
                }
            }
            .padding(.bottom, 30)
            Grid {
                GridRow {
                    Text("Depth")
                    Slider(value: $depth, in: 1...100) {
                        Text("Depth")
                    }
                }
                GridRow {
                    Text("Colors")
                    HStack {
                        ColorPicker("color", selection: $colors[0])
                        ColorPicker("color", selection: $colors[1])
                        Spacer()
                    }
                    .labelsHidden()
                }
            }
            .padding(30)
            .background(.thickMaterial)
            .frame(maxWidth: 320)
        }
        .frame(minHeight: 560)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
