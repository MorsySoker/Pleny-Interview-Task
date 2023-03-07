//
//  BaseResponce.swift
//  NetworkLayer
//
//  Created by MorsyElsokary on 02/11/2022.
//

import Foundation

struct BaseResponse<T>: Codable where T: Codable {
    let message: String
    let messageCode: Int?
    let data: T?
    let success: Bool?
	
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case messageCode = "MessageCode"
        case data = "Data"
        case success = "Success"
    }
}
