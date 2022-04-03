//
//  GeneralResponse.swift
//  Crispy
//
//  Created by Linus Skucas on 3/27/22.
//

import Foundation

struct GeneralResponse: Codable {
    var ok: Bool
    var error: String?
    
    var data: [Link]
    
    enum CodingKeys: String, CodingKey {
        case ok, data
        case error = "err"
    }
}
