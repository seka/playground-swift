//
//  ContentView.swift
//  Card
//
//  Created by shin.sekaryo on 2025/08/01.
//

import SwiftUI

struct ContentView: View {
    @State private var isFlipped = false
    
    private var rotation: Double {
        isFlipped ? 180 : 0
    }
    
    var body: some View {
        VStack {
            ZStack {
                CardContainer {
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("表面hogehuga")
                            Text("表面hogehuga")
                            Text("表面hogehuga")
                            Text("表面hogehuga")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .cardContainerAppearance(
                    DefaultCardContainerAppearance(spacing: 16, backgroundColor: .red)
                )
                .opacity(isFlipped ? 0 : 1)
                .rotation3DEffect(
                    .degrees(rotation),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: .center,
                    anchorZ: 0,
                    perspective: 1
                )
                
                CardContainer {
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("裏面hogehuga")
                            Text("裏面hogehuga")
                            Text("裏面hogehuga")
                            Text("裏面hogehuga")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .cardContainerAppearance(
                    DefaultCardContainerAppearance(spacing: 16, backgroundColor: .blue)
                )
                .opacity(isFlipped ? 1 : 0)
                .rotation3DEffect(
                    .degrees(rotation + 180),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: .center,
                    anchorZ: 0,
                    perspective: 1
                )
            }
            .frame(height: 200)
            .animation(.easeInOut(duration: 0.6), value: isFlipped)
            .onTapGesture {
                isFlipped.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    VStack {
        Spacer()
        ContentView()
        Spacer()
    }
    .background(.white)
}
