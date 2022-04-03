//
//  CommunicationsService.swift
//  Crispy
//
//  Created by Linus Skucas on 3/27/22.
//

import Foundation

struct CommunicationsService {
    var apiHost: URL
    var token: String
    
    
    func listAllLinks() async throws -> [Link] {
        var linkRequest = URLRequest(url: apiHost.appendingPathComponent("api").appendingPathComponent("link"))
        linkRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        linkRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        linkRequest.httpMethod = "GET"
        linkRequest.timeoutInterval = 30
        
        let (data, response) = try await URLSession.shared.data(for: linkRequest)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                  print((response as! HTTPURLResponse).statusCode)
                  fatalError()
              }
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(GeneralResponse.self, from: data)
        
        return decodedData.data
    }
}
