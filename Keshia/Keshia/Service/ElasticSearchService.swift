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
        let resourceString = "http://" + ip + ":9200/"
//        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceString
    }
    
    func search (_ elasticSearch: ElasticSearch, completionHandler: @escaping (String) -> ()) {
        let url = URL(string: resourceURL + "_search")!
        //var currentFunc = "TEST"
        do {
            var postRequest = URLRequest(url: url)
            postRequest.httpMethod = "POST"
            postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            print(String(data: try JSONEncoder().encode(elasticSearch), encoding: .utf8)!)
            postRequest.httpBody = try JSONEncoder().encode(elasticSearch)
            let postTask = URLSession.shared.dataTask(with: postRequest) {
                (data, response, error) in
                if (error == nil) {
                    //let backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
                    //print(backToString!)
                    do{
                        let responseJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                        if let responseJSON = responseJSON as? [String: Any]{
                            let hits = responseJSON["hits"] as! [String: Any]
                            let hitsArray = hits["hits"] as? [[String: Any]]
                            if (hitsArray!.count > 0) {
                                //print(hitsArray![0])
                                let source = hitsArray![0]["_source"] as! [String: Any]
                                
                                let currentFunc = source["ITEM_URL"] as! String
                                completionHandler(currentFunc)
                                //print(currentFunc)
//                                for json in hitsArray! {
//                                    let source = json["_source"] as! [String: Any]
//                                    currentFunc = source["ITEM_CONTENT"] as! String
//                                }
                            }
                            
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            postTask.resume()
        } catch {
        }
    }
    
    func analyze (_ elasticSearch: ElasticSearch, completionHandler: @escaping (String) -> ()) {
            let url = URL(string: resourceURL + "_analyze")!
            //var currentFunc = "TEST"
            do {
                var postRequest = URLRequest(url: url)
                postRequest.httpMethod = "POST"
                postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                print(String(data: try JSONEncoder().encode(elasticSearch), encoding: .utf8)!)
                postRequest.httpBody = try JSONEncoder().encode(elasticSearch)
                let postTask = URLSession.shared.dataTask(with: postRequest) {
                    (data, response, error) in
                    if (error == nil) {
                        //let backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
                        //print(backToString!)
                        do{
                            let responseJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                            if let responseJSON = responseJSON as? [String: Any]{
                                let hits = responseJSON["hits"] as! [String: Any]
                                let hitsArray = hits["hits"] as? [[String: Any]]
                                if (hitsArray!.count > 0) {
                                    //print(hitsArray![0])
                                    let source = hitsArray![0]["_source"] as! [String: Any]
                                    
                                    let currentFunc = source["ITEM_URL"] as! String
                                    completionHandler(currentFunc)
                                    //print(currentFunc)
    //                                for json in hitsArray! {
    //                                    let source = json["_source"] as! [String: Any]
    //                                    currentFunc = source["ITEM_CONTENT"] as! String
    //                                }
                                }
                                
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
                postTask.resume()
            } catch {
            }
        }
}

