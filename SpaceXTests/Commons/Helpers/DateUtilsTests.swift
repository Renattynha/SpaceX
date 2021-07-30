//
//  DateUtilsTests.swift
//  SpaceXTests
//
//  Created by Renata Martins on 30/07/2021.
//

import XCTest
@testable import SpaceX

class DateUtilsTests: XCTestCase {

    func testDateUtils_whenCreateDateWithTimestamp() {

        //Arrange
        let timestamp = 1596124108 //Thu Jul 30 2020 15:48:28 GMT+0000

        //Act
        let sut = Date(unixTimestamp: timestamp)
        let year = Calendar.current.dateComponents([.year], from: sut).year

        //Assert
        XCTAssertEqual(year, 2020, "When create a date from a timestamp, the initializer needs to return a date in 2020, but returned another date")
    }

    func testDateUtils_whenCreateDateWithoutTimestamp() {

        //Arrange
        let date = Date()
        let components = Calendar.current.dateComponents([.month, .day, .year], from: date)

        //Act
        let sut = Date(unixTimestamp: nil)
        let sutComponents = Calendar.current.dateComponents([.month, .day, .year], from: sut)

        //Assert
        XCTAssertEqual(sutComponents.year, components.year, "When create a date from a nil value, the initializer needs to return today date, but returned another date")
        XCTAssertEqual(sutComponents.month, components.month, "When create a date from a nil value, the initializer needs to return today date, but returned another date")
        XCTAssertEqual(sutComponents.day, components.day, "When create a date from a nil value, the initializer needs to return today date, but returned another date")
    }

    func testDateUtils_dateAndTimeString() {

        //Arrange
        let timestamp = 1596124108 //Thu Jul 30 2020 16:48:28
        let stringToCompare = "30 Jul 2020 at 16:48"

        //Act
        let sut = Date(unixTimestamp: timestamp).dateAndTimeString()

        //Assert
        XCTAssertEqual(stringToCompare, sut, "The dateAndTimeString needs to format a string in a way, but returned another way")
    }
}
