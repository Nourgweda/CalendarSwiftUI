//
//  Home.swift
//  CalendarSwiftUI
//
//  Created by Nour Gweda on 08/12/2022.
//

import SwiftUI

struct Home: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                //custom date picker
                CustomDatePicker(currentDate: $currentDate)
            }
        }
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
