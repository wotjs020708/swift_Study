//
//  ContentView.swift
//  TODOApp
//
//  Created by 어재선 on 4/13/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    var todoList: [SubTitleType] = [.done, .inProgress, .todo]
    var body: some View {
        VStack {
            TitleView()
            Spacer()
                .frame(height: 16)
            SubTitleView(subTitle: .todo)
            TodoListViewCell(color: .todo)
            SubTitleView(subTitle: .inProgress)
            TodoListViewCell(color: .inProgress)
            SubTitleView(subTitle: .done)
            TodoListViewCell(color: .done)
            Spacer()
            
        }
        .padding(.top,20)
        .padding(.horizontal, 16)
        
    }
}
//MARK: - TitleView
private struct TitleView: View {
    fileprivate var body: some View {
        HStack{
            Text("TODO")
                .font(.system(size: 40, weight: .bold))
            Spacer()
            
            Button(
                action: { },
                label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 28)
                        .foregroundStyle(.black)
                }
            )
            
        }
    }
}
// MARK: - subTitleView
private struct SubTitleView: View {
    var subTitle: SubTitleType
    
    fileprivate var body: some View {
        HStack{
            Text(subTitle.rawValue)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color(.lightGray))
                
            Spacer()
        }
    }
}
// MARK: - TODOListView
private struct TodoListView: View {
    var subTitles: [SubTitleType]
    
    fileprivate var body: some View {
        ScrollView {
            List(subTitles, id: \.self) { subTitle in
                SubTitleView(subTitle: subTitle)
            }
        }
            //TODO: 리스트 뷰 만들기
    }
}

// MARK: - TODOListCellView
private struct TodoListViewCell: View {
    var color: Color
    fileprivate var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(color)
                .cornerRadius(24)
            VStack {
                HStack {
                    Text("Text")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                }
                Spacer()
                    .frame(height: 60)
                HStack{
                    Text("data: 2000-0000")
                        .font(.system(size:16, weight: .bold ))
                        .foregroundStyle(.white)
                    Spacer()
                }
            }.padding(16)
        }
    }
}


#Preview {
    HomeView()
    
}
