//
//  GoogleService.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 10/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
class GoogleService {
    
    func createGoogleRequestWith(text: String, completion: @escaping (Google) -> Void) {
        guard let url = URL(string: Constants.GoogleAPI.baseURL) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = Constants.GoogleAPI.POST
        request.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
        let params = ["document": ["type": "PLAIN_TEXT", "content": text], "encodingType": "UTF8"] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else { return }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                guard let error = error?.localizedDescription else {return}
                print(error)
                return
            }
            guard let data = data else { return }
            guard let json = try? JSONDecoder().decode(Google.self, from: data) else {return}
            completion(json)
        }.resume()
    }
}
