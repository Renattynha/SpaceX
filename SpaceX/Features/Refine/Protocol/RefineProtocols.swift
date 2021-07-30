//
//  RefineProtocols.swift
//  SpaceX
//
//  Created by Renata Martins on 29/07/2021.
//

import Foundation

protocol RefineInternalProtocol: AnyObject {

    func willUpdateParameters(_ parameters: RefineParameters)

}
protocol RefineExternalProtocol: AnyObject {

   func willUpdateDataWithParameters(_ parameters: RefineParameters)
}
