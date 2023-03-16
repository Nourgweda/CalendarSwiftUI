//
//  Task.swift
//  CalendarSwiftUI
//
//  Created by Nour Gweda on 11/12/2022.
//

import Foundation

struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    //var date: Date = Date()
    var date: Date
}

struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
//    dateFormatter.timeZone = NSTimeZone(name: "GMT") as TimeZone?
//    let dateN: NSDate? = dateFormatter.date(from: "2016-02-29 12:24:26") as NSDate?
//    print(date?.getFormattedDate(format: "2016-02-29 12:24:26"), "🧚🏽")
    return date ?? Date()
    

    
}

let date = Date()
let format = date.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss") // Set output format

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

func setDate() -> Date{
    let isoDate = "2022-12-30 15:10:26"
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "GMT+2")
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let dateN = dateFormatter.date(from:isoDate)!
    return dateN
}


var tasks: [TaskMetaData] = [

    TaskMetaData(task: [
        Task(title: "Plan your meals a week ahead.", date: setDate())
    ], taskDate: setDate()),

    TaskMetaData(task: [
        Task(title: "Allow yourself plenty of time to do the shopping.", date: setDate())
    ], taskDate: getSampleDate(offset: -3)),

    TaskMetaData(task: [
        Task(title: "Ask for help if you cannot reach an item.", date: setDate())
    ], taskDate: getSampleDate(offset: -8)),

    TaskMetaData(task: [
        Task(title: "Go to the gym.", date: setDate())
    ], taskDate: getSampleDate(offset: 10)),

    TaskMetaData(task: [
        Task(title: "Plan your meals a week ahead.", date: setDate())
    ], taskDate: getSampleDate(offset: -22)),
    
    TaskMetaData(task: [
        Task(title: "Do the Calendar Task.", date: setDate())
    ], taskDate: getSampleDate(offset: 15)),
    
    TaskMetaData(task: [
        Task(title: "Fix the bugs.", date: setDate())
    ], taskDate: getSampleDate(offset: -20))
]
