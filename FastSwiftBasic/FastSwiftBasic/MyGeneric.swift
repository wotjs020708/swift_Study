//
//  MyGeneric.swift
//  FastSwiftBasic
//
//  Created by 어재선 on 10/14/24.
//

import SwiftUI

struct MyGeneric: View {
    @State var input:String = ""
    @State var myStack = MyStack<Int>()
    var body: some View {
        VStack {
            TextField("숫자를 입력해주세요", text: $input)
            Button{
                myStack.insertValue(input: Int(input) ?? 0)
            } label: {
                Text("저장")
            }
            Button {
                myStack.showData()
            } label: {
                Text("출력")
            }
        }
    }
}

struct MyStack<T> {
    var data: [T] = []
    
    mutating func insertValue(input: T) {
        data.append(input)
    }
    
    func showData() {
        data.forEach { item in
            print(item)}
    }
}
//
//struct MyFloatStack {
//    var data: [Float] = []
//    
//    mutating func insertValue(input: Float) {
//        data.append(input)
//    }
//    
//    func showData() {
//        data.forEach { item in
//            print(item)}
//    }
//}

#Preview {
    MyGeneric()
}
