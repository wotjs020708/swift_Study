//
//  ContentView.swift
//  swiftUI_Study
//
//  Created by 어재선 on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text("이름")
                            .bold()
                        Text("내 정보 보기")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                
            }
            
        }
        .toolbar {
            Button( action: {
                APIService().getTest()
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .foregroundStyle(.black)
                
            })
            Button( action: {
                
            }, label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .foregroundStyle(.black)
                
                
                
            })
        }
    }
}

#Preview {
    NavigationStack {
        
        ContentView()
    }
}
