//
//  PunchClockService.swift
//  Keshia
//
//  Created by 賴宜賢 on 2019/10/31.
//  Copyright © 2019 Keshia. All rights reserved.
//

import Foundation
struct PunchClockService {
    let resourceURL: String
    
    init(ip: String) {
        let resourceString = "http://" + ip + ":8180/bi/punchClock/"
//        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceString
    }
    
    func post (_ staffCode: StaffCode) {
        let url = URL(string: resourceURL + "queryPunchClock")!
        do {
            var postRequest = URLRequest(url: url)
            postRequest.httpMethod = "POST"
            postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            postRequest.httpBody = try JSONEncoder().encode(staffCode)
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
