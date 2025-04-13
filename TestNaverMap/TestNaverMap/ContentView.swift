//
//  ContentView.swift
//  TestNaverMap
//
//  Created by 어재선 on 4/10/25.
//

import SwiftUI
import NMapsMap
struct ContentView: View {
    var body: some View {
        ZStack {
            UIMapView()
                .edgesIgnoringSafeArea(.vertical)
        }
        .padding()
    }
}


struct UIMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let view = NMFNaverMapView()
        view.showZoomControls = false
        view.mapView.positionMode = .direction
        view.mapView.zoomLevel = 17
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    
    
}
#Preview {
    ContentView()
}
