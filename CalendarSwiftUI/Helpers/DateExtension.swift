//
//  DateExtension.swift
//  CalendarSwiftUI
//
//  Created by Nour Gweda on 11/12/2022.
//

import Foundation
extension Date {

    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.month, .year], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!

        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day,value: day - 1, to: startDate)!
        }
    }

    func getAllDatesWeek() -> [Date] {
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.day, .weekOfMonth, .month], from: self))!
        let range = calendar.range(of: .day, in: .weekOfMonth, for: startDate)!

        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day,value: day - 1, to: startDate)!
        }
    }
    
//     func fetchCurrentWeek(){
//        var currentWeek: [Date] = []
//        let today = Calendar.current
//        var calendar = Calendar(identifier: .gregorian)
//    
//        calendar.firstWeekday = 7
//        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
//        
//        (1...7).forEach{ day in
//            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek){
//                currentWeek.append(weekday)
//                print(self.currentWeek, "🥸")
//            }
//        }
//    }
}
