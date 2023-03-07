//
//  BaseService.swift
//  NetworkLayer
//
//  Created by MorsyElsokary on 03/11/2022.
//

import Foundation

protocol RequestService {
    var networkService: Requestable? { get }
    var fetchEndpoint: RequestEndpoint? { get set }
}
