//
//  ElasticSearchService.swift
//  Keshia
//
//  Created by 賴宜賢 on 2019/11/2.
//  Copyright © 2019 Keshia. All rights reserved.
//

import Foundation
struct ElasticSearchService {
    let resourceURL: String
    
    init(ip: String) {
        let resourceString = "http://" + ip + ":9200/_search"
//        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceString
    }
    
    func post (_ elasticSearch: ElasticSearch) {
        let url = URL(string: resourceURL)!
        do {
            var postRequest = URLRequest(url: url)
            postRequest.httpMethod = "POST"
            postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            print(String(data: try JSONEncoder().encode(elasticSearch), encoding: .utf8)!)
            postRequest.httpBody = try JSONEncoder().encode(elasticSearch)
            let postTask = URLSession.shared.dataTask(with: postRequest) {
                (data, response, error) in
                if (error == nil) {
                    let backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
                    print(backToString!)
//                    do{
//                        let responseJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                    } catch {
//                        print(error)
//                    }
                }
            }
            postTask.resume()
        } catch {
        }
    }
}
