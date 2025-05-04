//
//  CustomNavigationBar.swift
//  TODOApp
//
//  Created by 어재선 on 4/13/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    let isDisplayLeftBtn: Bool
    let isDisplayRightBtn: Bool
    let titleText: String?
    let leftBtnAction: () -> Void
    let rightBtnAction: () -> Void
    let rightBtnType: NvaigationBtnType
    
    init(isDisplayLeftBtn: Bool = true,
         isDisplayRightBtn: Bool = true,
         titleText: String? = nil,
         leftBtnAction: @escaping () -> Void = {},
         rightBtnAction: @escaping () -> Void = {},
         rightBtnType: NvaigationBtnType = .add
    ) {
        self.isDisplayLeftBtn = isDisplayLeftBtn
        self.isDisplayRightBtn = isDisplayRightBtn
        self.leftBtnAction = leftBtnAction
        self.rightBtnAction = rightBtnAction
        self.rightBtnType = rightBtnType
        self.titleText = titleText
    }
    
    var body: some View {
        HStack {
            if isDisplayLeftBtn {
                Button(
                    action: leftBtnAction,
                    label: {
                        Image(systemName:"chevron.left")
                            .foregroundStyle(.black)
                    }
                )
                
                Spacer()
                Text(titleText ?? "")
                    .font(.system(size: 17, weight: .semibold))
                Spacer()
                if isDisplayRightBtn {
                    Button(
                        action: rightBtnAction,
                        label: {
                            if rightBtnType == .add {
                                Image(systemName: "plus")
                                    .foregroundStyle(.black)
                            }
                        
                    })
                }
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 20)
    }
}

#Preview {
    CustomNavigationBar()
}
