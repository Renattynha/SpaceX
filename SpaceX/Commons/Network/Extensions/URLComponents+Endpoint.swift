//
//  URLComponents+Endpoint.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

extension URLComponents {

    init?(endpoint: EndpointDescriptor) {

        self.init()

        scheme = endpoint.scheme
        host = endpoint.host

        var endpointPath = endpoint.path
        if endpointPath.first != "/" {
            endpointPath = "/" + endpointPath
        }
        path = endpointPath

        guard let parameters = endpoint.parameters else {
            return
        }

        let checkedParameters = parameters.filter { item in
            let valueString = String(describing: item.value)
            return valueString != "nil"
        }
        
        queryItems = checkedParameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
