//
//  Choice.swift
//  FastSwiftBasic
//
//  Created by 어재선 on 10/5/24.
//

import SwiftUI

struct Choice: View {
    
    var direction: Direction = .north
    var member: Member = .leeo
    var menu: Menu = .steak("레어")
    var body: some View {
        Text("방향은 \(direction.rawValue)쪽 입니다")
    }
}

enum Member: String {
    case leeo = "리오"
    case tom = "톰"
    case bami = "바미"
    case koko = "코코"
}

enum Menu{
    case pasta
    case pizza
    case steak(String)
    
}

enum Direction: String{
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
}

#Preview {
    Choice()
}
