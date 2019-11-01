//
//  FlowService.swift
//  Keshia
//
//  Created by 賴宜賢 on 2019/10/31.
//  Copyright © 2019 Keshia. All rights reserved.
//

import Foundation

struct FlowService {
    var resourceURL: String
    
    init(ip: String) {
        let resourceString = "http://" + ip + ":8180/bi/flow/"
//        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceString
    }
    
    func createDayOffDetail (_ dayOff: DayOff) {
        let createDayOffDetailURL = URL(string: resourceURL + "createDayOffDetail")!
        do {
            var postRequest = URLRequest(url: createDayOffDetailURL)
            postRequest.httpMethod = "POST"
            postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            postRequest.httpBody = try JSONEncoder().encode(dayOff)
            let postTask = URLSession.shared.dataTask(with: postRequest) {
                (data, response, error) in
                if (error == nil) {
                    let backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
                    print(backToString!)
                    do{
                        let responseJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    } catch {
                        print(error)
                    }
                }
            }
            postTask.resume()
        } catch {
            print(error)
        }
    }
    
    func queryDayOffType () {
        let queryDayOffTypeURL = URL(string: resourceURL + "queryDayOffType")!
        
        do {
            var postRequest = URLRequest(url: queryDayOffTypeURL)
            postRequest.httpMethod = "GET"
            postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let postTask = URLSession.shared.dataTask(with: postRequest) {
                (data, response, error) in
                if (error == nil) {
                    //let backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
                    //print(backToString!)
                    do{
                        let responseJSON = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                        if let responseJSON = responseJSON as? [String: Any]{
                            let jsonArray = responseJSON["list"] as? [[String: Any]]
                            for json in jsonArray! {
                                let typeName = json["typeName"] as! String
                                print(typeName)
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            postTask.resume()
        } catch {
            print(error)
        }
    }
}
