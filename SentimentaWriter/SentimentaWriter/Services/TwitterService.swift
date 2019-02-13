//
//  TwitterService.swift
//  SentimentaWriter
//
//  Created by Samuel Pinheiro Junior on 10/02/19.
//  Copyright © 2019 Samuel Pinheiro Junior. All rights reserved.
//

import Foundation
import TwitterKit

class TwitterService {
    
    func fetchTwitterWith(name: String, completion: @escaping (Twitter) -> Void) {
        let url = Constants.TwetterAPI.baseURL
        let params = ["screen_name": name, "count": "10"]
        let client = TWTRAPIClient()
        var clientError: NSError?
        let request = client.urlRequest(withMethod: "GET", urlString: url, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, error) in
            if error != nil {
                guard let error = error?.localizedDescription else {return}
                print(error)
                return
            }
            guard let data = data else { return }
            guard let json = try? JSONDecoder().decode(Twitter.self, from: data) else {return}
            completion(json)
        }
    }
}
    
    

