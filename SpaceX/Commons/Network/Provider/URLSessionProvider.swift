//
//  File.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

final class URLSessionProvider: NetworkProviderProtocol, RequestHandleResponsable {

    private let session: URLSession

    init() {
        session = URLSession(configuration: URLSession.shared.configuration)
    }

    func performRequest<T: Decodable>(endpoint: EndpointDescriptor, result: @escaping ResultHandler<T>) {

        guard let request = URLRequest(endpoint: endpoint) else {
            preconditionFailure("Fail on create request")
        }

        NetworkLogger.log(request: request)

        let task = session.dataTask(with: request) { data, response, error in

            DispatchQueue.main.async {
                let response = response as? HTTPURLResponse
                self.handleResponse(data: data, response: response, error: error, result: result)
            }
        }
        task.resume()
    }
}
