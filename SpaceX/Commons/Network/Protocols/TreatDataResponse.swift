//
//  TreatDataResponse.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

protocol TreatDataResponse: TreatJSONDecode {

    func treatDataResponse<T: Decodable>(data: Data, response: HTTPURLResponse, result: ResultHandler<T>)
}

extension TreatDataResponse {

    func treatDataResponse<T: Decodable>(data: Data, response: HTTPURLResponse, result: ResultHandler<T>) {

        switch response.statusCode {
        case 200...299:
            treatJSONDecode(data: data, result: result)
        default:
            result(.failure(NetworkError(statusCode: response.statusCode)))
        }
    }
}
