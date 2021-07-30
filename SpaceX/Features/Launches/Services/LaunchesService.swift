//
//  LaunchesService.swift
//  SpaceX
//
//  Created by Renata Martins on 26/07/2021.
//

import Foundation

struct LaunchesService {

    func fetchAllLaunches(completion: @escaping (_ launches: Launches?, _ error: NetworkError?) -> Void) {

        let endpoint = LaunchesEndpoint.allLaunches
        URLSessionProvider().performRequest(endpoint: endpoint) { (value: Result<Launches, NetworkError>) in
            switch value {
            case let .success(value):
                completion(value, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    func fetchLaunches(parameters: RefineParameters, completion: @escaping (_ launches: Launches?, _ error: NetworkError?) -> Void) {

        let endpoint = LaunchesEndpoint.launches(parameters: parameters)
        URLSessionProvider().performRequest(endpoint: endpoint) { (value: Result<Launches, NetworkError>) in
            switch value {
            case let .success(value):
                completion(value, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    func fetchCompanyInfo(completion: @escaping (_ company: Company?, _ error: NetworkError?) -> Void) {

        let endpoint = InfoEndpoint()
        URLSessionProvider().performRequest(endpoint: endpoint) { (value: Result<Company, NetworkError>) in
            switch value {
            case let .success(value):
                completion(value, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }

    }
}
