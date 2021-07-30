//
//  NetworkProviderProtocol.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

typealias ResultHandler<T> = (Result<T, NetworkError>) -> Void

protocol NetworkProviderProtocol {

    func performRequest<T: Decodable>(endpoint: EndpointDescriptor, result: @escaping ResultHandler<T>)
}
