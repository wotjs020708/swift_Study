//
//  Exception.swift
//  FastSwiftBasic
//
//  Created by 어재선 on 10/14/24.
//

import SwiftUI

struct Exception: View {
    
    @State var inputNumber: String = ""
    @State var resultNumber: Float = 0
    var body: some View {
        VStack {
            TextField("나눌 숫자를 입력해주세요", text: $inputNumber)
            Text("나눈 결과는 다음과 같아요 \(resultNumber)")
            Button {
                
                do{
                    try resultNumber = devideTen(with: (Float(inputNumber) ?? 1.0))
                    
                } catch DivideError.dividedByZero{
                    print("0으로 나누었대요.")
                    resultNumber = -99
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("나누기")
            }
            
        }
    }
    
    func devideTen(with inputNumber: Float) throws -> Float {
        var reslut: Float = 0
        
        if inputNumber == 0 {
//            error
            throw DivideError.dividedByZero
        } else {
            reslut = 10 / inputNumber
            
        }
        return resultNumber
        
    }
}

enum DivideError: Error {
    case dividedByZero
}

#Preview {
    Exception()
}
