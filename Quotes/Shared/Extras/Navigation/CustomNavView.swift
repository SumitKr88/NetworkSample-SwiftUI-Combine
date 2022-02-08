//
//  CustomNavView.swift
//  YoutubeRelica
//
//  Created by Sumit Kumar on 06/02/22.
//

import Foundation
import SwiftUI

struct CustomNavView<Content: View, Destination : View>: View {
    
    let color: UIColor
    
    var body: some View {
        ContentView()
    }
    
}

struct CustomNavBar<Content>: View where Content: View {
    
    let title: String
    let content: Content
    
    var body: some View {
        NavigationView {
            ZStack {
                WaveShape()
                VStack {
                    Image(systemName: "sun.min.fill")
                        .resizable()
                        .frame(height: 135)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
                content
            }
            .navigationBarTitle(title, displayMode: .inline)
        }
    }
}

struct WaveShape : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY * 0.5),
                      control2: CGPoint(x: rect.maxX * 0.35, y: rect.maxY * 2))
        return path
    }
}

