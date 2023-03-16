//
//  CalendarViewModel.swift
//  CalendarSwiftUI
//
//  Created by Nour Gweda on 11/12/2022.
//

import Foundation
class CalendarViewModel {
        
    func extractYearAndMonth(currentDate: Date) -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentWeek(currentWeek: Int) -> Date {
        let calendar = Calendar.current
        guard let currentWeek = calendar.date(byAdding: .weekOfMonth, value: currentWeek, to: Date()) else {
            return Date()
        }
        return currentWeek
    }
    
    func getCurrentMonth(currentMonth: Int) -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    
    
    
    func extractDate(currentMonth: Int, currentWeek: Int) -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = self.getCurrentMonth(currentMonth: currentMonth)
        //let currentWeek = self.getCurrentWeek(currentWeek: currentMonth)
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }

        var currentWeeks = self.getCurrentWeek(currentWeek: currentWeek)
        print(currentWeek, "🥸")
        var weekdays = currentWeeks.getAllDatesWeek().compactMap { date -> DateValue in
            let wday = calendar.component(.weekday, from: date)
            print(DateValue(day: wday, date: date), "🐙")

            
//            currentWeeks.fetchCurrentWeek()
            return DateValue(day: wday, date: date)
        }
        
        
        //adding offset to current the exact week day
       // let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
    
    
    func checkIfSameDay(firstDate: Date, SecondDate: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(firstDate, inSameDayAs: SecondDate)
    }
    

    
    
}
 
