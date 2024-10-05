//
//  Diff.swift
//  FastSwiftBasic
//
//  Created by 어재선 on 10/5/24.
//

import SwiftUI

struct Diff: View {
    
    let myCar = Car(name: "붕붕카", owner: "붕붕")
    @ObservedObject var myKar = Kar(name: "붕붕카2", owner: "붕붕2")
    
    var body: some View {
        Text("\(myKar.name)의 주인은 \(myKar.owner)입니다.")
        Button {
            
            let broCar = myKar
            broCar.name = "동생차"
            broCar.owner = "동생"
            
            myKar.sayHi()
        } label: {
            Text("출발")
        }
        
    }
}


struct Car {
    let name: String
    let owner: String
    
    func sayHi() {
        print("hi \(owner)")
    }
}

class Kar: ObservableObject {
    @Published var name: String
    var owner: String
    
    init(name: String, owner: String) {
        self.name = name
        self.owner = owner
    }
    
    func sayHi() {
        print("hi \(owner)")
    }
}

#Preview {
    Diff()
}
