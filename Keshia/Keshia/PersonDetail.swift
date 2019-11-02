//
//  PersonDetail.swift
//  Keshia
//
//  Created by 秦士翔 on 2019/10/28.
//  Copyright © 2019 Keshia. All rights reserved.
//

import SwiftUI
import UIKit

struct PersonDetail: View {
    let person: Person
    @State private var zoomed = false
    
    var body: some View {
        ZStack(alignment: .topLeading ) {
            Image(person.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(person.name), displayMode: .inline)
                .onTapGesture {
                    //withAnimation{ self.zoomed.toggle()}
                    //testCallApi()
                    let flowService = FlowService(ip: "10.107.14.6")
                    flowService.queryDayOffType()
                    print("=====================")
                    let elasticSearchService = ElasticSearchService(ip: "10.107.83.17")
                    //let cotent = "我想要請假"
                    
                    let matchObject = match(ITEM_CONTENT: "我想要請假")
                    let queryObject = query(match: matchObject)
                    let elasticSearch = ElasticSearch(query: queryObject)
                    
                    elasticSearchService.post(elasticSearch)
                }
            .frame(minWidth:0, maxWidth: .infinity)
            Image(systemName: "video.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.all)
        }
    }
    
}

func testCallApi() {
    let apiUrl = URL(string: "http://10.107.14.59:8180/bi/flow/createDayOffDetail")!
    var request = URLRequest(url: apiUrl)
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) {
        (data, response, error) in
        if (error == nil) {
            let backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
            print(backToString!)
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
    task.resume()
    let queryPunchClockURL = URL(string: "http://10.107.14.59:8180/bi/phonebook/queryUser")!
    do {
        var postRequest = URLRequest(url: queryPunchClockURL)
        postRequest.httpMethod = "POST"
        postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let staffCode = StaffCode(staffCdoe: "11983")
        postRequest.httpBody = try JSONEncoder().encode(staffCode)
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
        
    }
    
    
    
    
    //UIApplication.shared.open(apiU rl)
}

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(person: testData[0])
    }
}
