//
//  HomeView.swift
//  Keshia
//
//  Created by 秦士翔 on 2019/10/28.
//  Copyright © 2019 Keshia. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Keshia")
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .foregroundColor(.blue)
            VStack {
                Image(systemName: "mic.fill")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
