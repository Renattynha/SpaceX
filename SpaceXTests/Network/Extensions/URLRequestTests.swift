//
//  URLRequestTests.swift
//  SpaceXTests
//
//  Created by Renata Martins on 26/07/2021.
//

import XCTest
@testable import SpaceX

class URLRequestTests: XCTestCase {

    var mockEndpointWithValidDescriptor: MockEndpointDescriptorWithParameters!

    override func setUp() {

        self.mockEndpointWithValidDescriptor = MockEndpointDescriptorWithParameters()
    }

    override func tearDown() {

        self.mockEndpointWithValidDescriptor = nil
    }

    func testURLRequest_WithValidURL() {

        let sut = URLRequest(endpoint: mockEndpointWithValidDescriptor)

        XCTAssertNotNil(sut, "When initialize URLRequest from an valid endpoint, the init has to return an URLRequest, and returned nil")
        XCTAssertEqual(sut?.httpMethod, HttpMethod.get.toString())
        XCTAssertEqual(sut?.allHTTPHeaderFields?.count, 1)
    }
}
