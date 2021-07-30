//
//  Date+Utils.swift
//  SpaceX
//
//  Created by Renata Martins on 28/07/2021.
//

import Foundation

extension Date {

    init(unixTimestamp: Int?) {

        if let timestamp = unixTimestamp {
            self = Date(timeIntervalSince1970: TimeInterval(timestamp))
        } else {
            self = Date()
        }
    }

    func dateAndTimeString() -> String {

        let formatter = DateFormatter()
        formatter.timeZone = .current

        formatter.dateFormat = "d MMM y 'at' HH:mm"
        return formatter.string(from: self)
    }

    func daysToCurrentDate() -> Int {

        let calendar = Calendar.current

        let numberOfDays = calendar.dateComponents([.day], from: self, to: Date())
        return numberOfDays.day ?? 0
    }

    func currentYear() -> Int {
        let calendar = Calendar.current
        return calendar.dateComponents([.year], from: self).year ?? 0
    }
}
