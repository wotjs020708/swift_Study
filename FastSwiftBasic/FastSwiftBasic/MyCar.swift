//
//  MyCar.swift
//  FastSwiftBasic
//
//  Created by 어재선 on 10/14/24.
//

import SwiftUI

protocol Driveble {
    func speedDown(with speed: Int) -> Int
    
    
}

struct MyCar: View {
    var myCar: KIA = KIA()
    var broCar: Hyunde = Hyunde()
    let cars: [Driveble] = [KIA(), Hyunde()]
    @State var speed: Int = 10

    var body: some View {
        VStack {
            Text("speed: \(speed)")
            Button {
                speed = broCar.speedDown(with: speed)
                cars.randomElement()?.speedDown(with: speed)
            } label: {
                Text("감속!")
            }
        }

    }
}

struct KIA: Driveble {
    func speedDown(with speed: Int) -> Int {
        print("속도가 0 으로 줄어듭니다.")
        return speed - 5
    }
    
    
}

struct Hyunde: Driveble {
    func speedDown(with speed: Int) -> Int {
        print("속도가 촤촤 줄어들어요.")
        return speed - 9
    }
}
#Preview {
    MyCar()
}
