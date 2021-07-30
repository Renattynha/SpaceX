//
//  HttpMethodTests.swift
//  SpaceXTests
//
//  Created by Renata Martins on 26/07/2021.
//

import XCTest
@testable import SpaceX

class HttpMethodTests: XCTestCase {

    func testHttpMethod_WhenChoose_Get() {

        //Arrange
        let sut = HttpMethod.get.toString()

        //Assert
        XCTAssertEqual(sut, "GET", "When choose the httpMehtod get, the toString() has to return GET but returned \(sut)")
    }

    func testHttpMethod_WhenChoose_Post() {

        //Arrange
        let sut = HttpMethod.post.toString()

        //Assert
        XCTAssertEqual(sut, "POST", "When choose the httpMehtod post, the toString() has to return POST but returned \(sut)")
    }

    func testHttpMethod_WhenChoose_Put() {

        //Arrange
        let sut = HttpMethod.put.toString()

        //Assert
        XCTAssertEqual(sut, "PUT", "When choose the httpMehtod put, the toString() has to return PUT but returned \(sut)")
    }

    func testHttpMethod_WhenChoose_Delete() {

        //Arrange
        let sut = HttpMethod.delete.toString()

        //Assert
        XCTAssertEqual(sut, "DELETE", "When choose the httpMehtod delete, the toString() has to return DELETE but returned \(sut)")
    }
}
