//
//  Link.swift
//  Crispy
//
//  Created by Linus Skucas on 3/24/22.
//

import Foundation

struct Link: Identifiable, Codable {
    var id: Int

    var name: String
    var description: String
    var url: URL
    var isPublic: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, url
        case isPublic = "public"
    }
}
