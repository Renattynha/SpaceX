//
//  URLComponentsTests.swift
//  SpaceXTests
//
//  Created by Renata Martins on 26/07/2021.
//

import XCTest
@testable import SpaceX

class URLComponentsTests: XCTestCase {

    var mockEndpointWithParametersDescriptor: MockEndpointDescriptorWithParameters!
    var mockEndpointWithoutParametersDescriptor: MockEndpointDescriptorWithoutParameters!

    override func setUp() {

        self.mockEndpointWithParametersDescriptor = MockEndpointDescriptorWithParameters()
        self.mockEndpointWithoutParametersDescriptor = MockEndpointDescriptorWithoutParameters()
    }

    override func tearDown() {

        self.mockEndpointWithParametersDescriptor = nil
        self.mockEndpointWithoutParametersDescriptor = nil
    }

    func testURLComponents_WithParameters() {

        let sut = URLComponents(endpoint: mockEndpointWithParametersDescriptor)

        XCTAssertNotNil(sut, "When initialize URLComponents from an valid endpoint, the init has to return an URLComponents, and returned nil")
        XCTAssertEqual(sut?.host, "api.spacexdata.com")
        XCTAssertEqual(sut?.scheme, "https")
        XCTAssertEqual(sut?.path, "/v3/capsules")
        XCTAssertEqual(sut?.queryItems?.count, 2)
    }

    func testURLComponents_WithoutParameters() {

        let sut = URLComponents(endpoint: mockEndpointWithoutParametersDescriptor)

        XCTAssertNotNil(sut, "When initialize URLComponents from an valid endpoint, the init has to return an URLComponents, and returned nil")
        XCTAssertEqual(sut?.host, "api.spacexdata.com")
        XCTAssertEqual(sut?.scheme, "https")
        XCTAssertEqual(sut?.path, "/v3/capsules")
        XCTAssertNil(sut?.queryItems)
    }
}
