//
//  ContentView.swift
//  TODOApp
//
//  Created by 어재선 on 4/13/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [Todo]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                TitleView()
                if(todos.isEmpty){
                    Spacer()
                        .frame(height: 200)
                    Text("Empty Todo")
                        .font(.system(size: 20, weight: .light))
                    Spacer()
                } else {
                    TodoListView(todos: todos)
                }
                
                
            }
            .padding(.top,20)
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}
//MARK: - TitleView
private struct TitleView: View {
    fileprivate var body: some View {
        HStack{
            Text("TODO")
                .font(.system(size: 40, weight: .bold))
            Spacer()
            
            NavigationLink(
                destination: TodoAddView(),
                label: { Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 28)
                        .foregroundStyle(.black)
                }
            ).navigationBarBackButtonHidden(true)
            
        }
    }
}

// MARK: - subTitleView
private struct SubTitleView: View {
    var subTitle: TodoStatus
    
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
    var todos: [Todo]
    
    fileprivate var body: some View {

        SubTitleView(subTitle: .todo)
        ForEach(todos) { todo in
            if todo.status == TodoStatus.todo.rawValue {
                NavigationLink(destination:TodoDetailView(todo: todo) , label:{
                    TodoListViewCell(todo: todo)
                }
                )
                
            }
        }
        Spacer()
        SubTitleView(subTitle: .inProgress)
        ForEach(todos) { todo in
            if todo.status == TodoStatus.inProgress.rawValue {
                NavigationLink(destination:TodoDetailView(todo: todo) , label:{
                    TodoListViewCell(todo: todo)
                }
                )

            }
        }
        Spacer()
        SubTitleView(subTitle: .done)
        ForEach(todos) { todo in
            if todo.status == TodoStatus.done.rawValue {
                NavigationLink(destination:TodoDetailView(todo: todo) , label:{
                    TodoListViewCell(todo: todo)
                }
                )
            }
        }
        Spacer()
        
    }
}

// MARK: - TODOListCellView
private struct TodoListViewCell: View {
    let todo: Todo
    fileprivate var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(
                    todo.status == "Todo" ? .todo :
                        todo.status == "Done" ? .done : .inProgress)
                .cornerRadius(24)
            VStack {
                HStack {
                    Text(todo.title)
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                }
                Spacer()
                    .frame(height: 60)
                if todo.endDate != nil {
                    HStack{
                        Text("data: \(todo.startDate.fromattedDateString)-\(String(describing: todo.endDate!.fromattedDateString))")
                            .font(.system(size:16, weight: .bold ))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                } else {
                    HStack {
                        Text("data: \(todo.startDate.fromattedDateString)")
                            .font(.system(size:16, weight: .bold ))
                            .foregroundStyle(.white)
                        Spacer()
                    }
                }
                
            }.padding(16)
        }
    }
}


#Preview {
    HomeView()
    
}
