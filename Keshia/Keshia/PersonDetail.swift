//
//  PersonDetail.swift
//  Keshia
//
//  Created by 秦士翔 on 2019/10/28.
//  Copyright © 2019 Keshia. All rights reserved.
//

import SwiftUI

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
                    withAnimation{ self.zoomed.toggle()}
                }
            .frame(minWidth:0, maxWidth: .infinity)
            Image(systemName: "video.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.all)
        }
    }
}

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(person: testData[0])
    }
}
