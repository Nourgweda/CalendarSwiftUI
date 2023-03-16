//
//  CustomDatePicker.swift
//  CalendarSwiftUI
//
//  Created by Nour Gweda on 08/12/2022.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    @State var currentMonth: Int  = 0
    @State var currentWeek: Int  = 0
    let viewModel = CalendarViewModel()
    let formatter = DateFormatter()
    
    var body: some View {
        VStack(spacing: 35) {
            
            let days: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.extractYearAndMonth(currentDate: currentDate)[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(viewModel.extractYearAndMonth(currentDate: currentDate)[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                        currentWeek -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }

                Button {
                    withAnimation {
                        currentMonth += 1
                        currentWeek += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            VStack(spacing: 0) {
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(viewModel.extractDate(currentMonth: currentMonth, currentWeek: currentWeek)) { value in
                    //ForEach(viewModel.extractDate(currentMonth: currentWeek)) { value in
                        cardView(value: value)
                            .background(
                            Capsule()
                                .fill(Color("Pink"))
                                .padding(.horizontal, 8)
                                .opacity(viewModel.checkIfSameDay(firstDate: value.date, SecondDate: currentDate) ? 1 : 0 )
                            ).onTapGesture {
                                currentDate = value.date
                            }
                    }
                }
                
                VStack(spacing: 15) {
                    Text("Tasks")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 20)

                    if let task = tasks.first(where: { task in
                        return viewModel.checkIfSameDay(firstDate: task.taskDate, SecondDate: currentDate)
                    }){
                        ForEach(task.task){ task in
                            VStack(alignment: .leading, spacing: 10) {
                                //Text(task.date.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                                Text("\(task.date)")

                                Text(task.title)
                                    .font(.title2.bold())
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                            Color("Purple")
                                .opacity(0.2)
                                .cornerRadius(10)
                            )
                        }
                    } else {
                        Text("No Task Found")
                    }
                }
                .padding()
            }
            
        }.onChange(of: currentMonth) { newValue in
            currentDate = viewModel.getCurrentMonth(currentMonth: currentMonth)
            //currentDate = viewModel.getCurrentWeek(currentWeek: currentWeek)
            print(viewModel.getCurrentMonth(currentMonth: currentMonth), "month🐙")
            print(viewModel.getCurrentWeek(currentWeek: currentWeek), "week🐙")
        }
    }
    
    @ViewBuilder
    func cardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {

                if let task = tasks.first(where: { task in
                    
                    return viewModel.checkIfSameDay(firstDate: task.taskDate, SecondDate: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(viewModel.checkIfSameDay(firstDate: task.taskDate, SecondDate: currentDate) ?
                            .white : .primary)
                        .frame(maxWidth: .infinity)

                    Spacer()

                    Circle()
                        .fill(viewModel.checkIfSameDay(firstDate: task.taskDate, SecondDate: currentDate) ?
                            .white : Color("Pink"))
                        .frame(width: 8, height: 8)
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(viewModel.checkIfSameDay(firstDate: value.date, SecondDate: currentDate) ?
                            .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }

}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

