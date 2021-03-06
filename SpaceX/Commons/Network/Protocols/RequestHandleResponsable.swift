//
//  File.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

protocol RequestHandleResponsable: TreatDataResponse {

    func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, result: ResultHandler<T>)
}

extension RequestHandleResponsable {

    func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, result: ResultHandler<T>) {

        if let error = error {
            return result(.failure(NetworkError(description: error.localizedDescription)))
        }

        guard let response = response, let data = data else {
            return result(.failure(.noJSONData))
        }

        treatDataResponse(data: data, response: response, result: result)
    }

}
