//
//  TodoAddView.swift
//  TODOApp
//
//  Created by 어재선 on 4/28/25.
//

import SwiftUI
import SwiftData
struct TodoAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var title: String = ""
    @State var note: String = ""
    @State var startDate: Date = .now
    @State var endDate: Date = .now
    @State var isShowStartDatePicker: Bool = false
    @State var isShowEndDatePicker: Bool = false
    var body: some View {
        
        CustomNavigationBar(
            isDisplayLeftBtn: true,
            titleText: "ADD TODO",
            leftBtnAction: {
              dismiss()
            },
            rightBtnAction: {
                addTodo(todo: Todo(title: title, startDate: startDate), modelContext: modelContext)
                dismiss()
                
            }
        )
        ScrollView {
            VStack {
                subTitleView(text: "Title")
                TitleTextField(text: $title)
                    .frame(height: 56)
                Spacer()
                    .frame(height: 16)
                subTitleView(text: "Date")
                customPickerView(text: "StartDate", date: $startDate, isShowDatePicker: isShowStartDatePicker)
                Spacer()
                    .frame(height: 8)
                customPickerView(text: "EndDate", date: $endDate, isShowDatePicker: isShowEndDatePicker)
                Spacer()
                    .frame(height: 16)
                subTitleView(text: "Note")
                Spacer()
                    .frame(height: 8)
                NoteTextField(text: $note)            .frame(height: 500)
                Spacer()
                
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
    }

}
//MARK: - TitleTextField
private struct TitleTextField: View {
    var text: Binding<String>
    fileprivate var body: some View {
        TextField("Text", text: text)
            .padding(16)
            .font(.system(size: 24, weight: .medium))
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(16)
    }
}
//MARK: - NoteTextField
private struct NoteTextField: View {
    var text: Binding<String>
    fileprivate var body: some View {
        TextEditor(text: text)
            
            .scrollContentBackground(.hidden)
            .padding(16)
            .background(.gray.opacity(0.2))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
        
    }
}
//MARK: - subTitleView
private struct subTitleView: View {
    var text: String
    fileprivate var body: some View {
        HStack{
            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color(.lightGray))
            Spacer()
        }
        
    }
}

//MARK: - customPickerView
private struct customPickerView: View {
    var text: String
    var date: Binding<Date>
    @State var isShowDatePicker: Bool
    fileprivate var body: some View {
        Button(
            action: {
                isShowDatePicker.toggle()
                
            },
            label: {
                Text(text)
                    .font(.system(size: 24, weight: .medium))
                    .frame(width: 370, height: 56)
                    .background(.gray.opacity(0.2))
                    .foregroundStyle(.gray.opacity(0.2))
                    .cornerRadius(16)
            }
            
        )
        if isShowDatePicker {
            DatePicker(
                                "",
                                selection: date,
                                displayedComponents: .date
                            )
                            .labelsHidden()
                            .datePickerStyle(.graphical)
                            .frame(maxHeight: 400)

        }
    }
}

// MARK: - function
private func addTodo(todo: Todo, modelContext: ModelContext) {
        modelContext.insert(todo)
}

#Preview {
    TodoAddView()
}
