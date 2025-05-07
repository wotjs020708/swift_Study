//
//  TodoDetailView.swift
//  TODOApp
//
//  Created by 어재선 on 5/4/25.
//

import SwiftUI

struct TodoDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var todo: Todo
    var body: some View {
        
        CustomNavigationBar(leftBtnAction: {
            dismiss()
        })
        NavigationStack {
            HStack{
                Text(todo.title)
                    .font(.system(size: 40,weight: .bold))
                Spacer()
            }
            Divider()
            HStack {
                Text("StartDate:")
                    .font(.system(size: 14,weight: .bold))
                Spacer()
                Text(todo.startDate.fromattedDateString)
                    .font(.system(size: 14,weight: .medium))
            }
            HStack {
                Text("EndDate:")
                    .font(.system(size: 14,weight: .bold))
                Spacer()
                Text(todo.endDate != nil ? todo.endDate!.fromattedDateString : "N/A")
                    .font(.system(size: 14,weight: .medium))
            }
            Divider()
            HStack {
                Text("Note")
                    .font(.system(size: 16,weight: .bold))
                Spacer()
            }
            VStack{
                if todo.note != nil {
                    Text(todo.note ?? "")
                        .font(.system(size: 16,weight: .semibold))
                } else {
                    Text("Not Note")
                        .font(.system(size: 16,weight: .semibold))
                }
            }
            Divider()
            HStack {
                Text("State")
                    .font(.system(size: 16,weight: .bold))
                Spacer()
            }
          
            StateButton(todo: todo, todoState: .todo)
            StateButton(todo: todo, todoState: .inProgress)
            StateButton(todo: todo, todoState: .done)
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 16)
    }
}




private struct Divider: View {
    fileprivate var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color.gray)
    }
}

private struct StateButton: View {
    var todo: Todo
    var todoState: TodoStatus
    fileprivate var body: some View {
        Button(action: {
            todo.status = todoState.rawValue
        }, label: {
            ZStack{
                Rectangle()
                    .foregroundStyle(
                        todoState.rawValue == "Todo" ? .todo :
                            todoState.rawValue == "Done" ? .done : .inProgress)
                    .cornerRadius(16)
                HStack{
                    Text(todoState.rawValue)
                        .foregroundStyle(.white)
                        .font(.system(size: 24,weight: .bold))
                    if todo.status == todoState.rawValue{
                        Circle()
                            .foregroundStyle(.green)
                            .frame(width: 10, height: 10)
                    }
                    
                }
                  
            }
            
        })
        .frame(height: 56)
    }
}

#Preview {
    TodoDetailView(todo: Todo(title: "Title", startDate: .now))
}
