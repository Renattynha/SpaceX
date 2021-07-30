//
//  EndpointDescriptorTests.swift
//  SpaceXTests
//
//  Created by Renata Martins on 26/07/2021.
//

import XCTest
@testable import SpaceX

class EndpointDescriptorTests: XCTestCase {

    var mockEndpointDescriptor: MockEndpointDescriptorWithParameters!

    override func setUp() {

        self.mockEndpointDescriptor = MockEndpointDescriptorWithParameters()
    }

    override func tearDown() {

        self.mockEndpointDescriptor = nil
    }

    func testEndpointDescriptor() {

        XCTAssertEqual(self.mockEndpointDescriptor.host, "api.spacexdata.com")
        XCTAssertEqual(self.mockEndpointDescriptor.method, HttpMethod.get)
        XCTAssertEqual(self.mockEndpointDescriptor.path, "v3/capsules")
        XCTAssertEqual(self.mockEndpointDescriptor.scheme, "https")
        XCTAssertNotNil(self.mockEndpointDescriptor.header)
        XCTAssertNotNil(self.mockEndpointDescriptor.parameters)
        XCTAssertNil(self.mockEndpointDescriptor.body)
    }
}
