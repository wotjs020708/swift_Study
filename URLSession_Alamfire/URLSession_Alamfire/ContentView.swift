//
//  ContentView.swift
//  URLSession_Alamfire
//
//  Created by 어재선 on 9/26/24.
//

import SwiftUI

struct ContentView: View {
    let gradient: LinearGradient = {
        let colors: [Color] = [ .orange, .pink, .purple, .red, .yellow, .cyan]
        
        return LinearGradient(gradient: Gradient(colors: [colors.randomElement()!, colors.randomElement()!]), startPoint: .center, endPoint: .topTrailing)
    }()
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                    .cornerRadius(10)
                Spacer()
                Divider()
                Text("Click here")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                    .frame(width: 300, alignment:  .leading)
                VStack {
                    Button {
                        print("Alamofire Button Clicked")
                        
                    } label: {
                        NavigationLink("Alamofire") {
                            AlamofireView()
                        }
                        .frame(width: 300)
                        .padding()
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    
                }
            }
            .background(gradient)
        }
    }
}

#Preview {
    ContentView()
}
