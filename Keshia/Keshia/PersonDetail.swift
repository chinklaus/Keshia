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
                    testCallApi()
                    print("TEST")
                }
            .frame(minWidth:0, maxWidth: .infinity)
            Image(systemName: "video.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.all)
        }
    }
    
}

func testCallApi() {
    let apiUrl = URL(string: "http://10.5.3.202:8080/bi/test/test_get_200")!
    var request = URLRequest(url: apiUrl)
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) {
        (data, response, error) in
        if (error == nil) {
            var backToString = String(data: data!, encoding: String.Encoding.utf8) as String?
            print(backToString!)
        }
        
    }
    task.resume()
    
    //UIApplication.shared.open(apiU rl)
}

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(person: testData[0])
    }
}
