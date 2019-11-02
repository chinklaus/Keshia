//
//  CreateDayOffView.swift
//  Keshia
//
//  Created by 秦士翔 on 2019/11/2.
//  Copyright © 2019 Keshia. All rights reserved.
//

import SwiftUI

struct CreateDayOffView: View {
    var body: some View {
         NavigationView{
            HStack() {
            VStack(alignment: .leading){
            Text("Brian Chen, 陳可評")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom)
            Text("2019/10/16 (三)").foregroundColor(.black).padding(.bottom)
            HStack{
                Text("時間:").font(.headline).foregroundColor(.black)
                Text("8:30~17:30").foregroundColor(.black)
            }
            .padding(.bottom)
            HStack{
                HStack{
                    Text("假別:").font(.headline).foregroundColor(.black)
                    Text("事假").foregroundColor(.black)
                    Text(",").foregroundColor(.black)
                }
                HStack{
                    Text("請假時數").font(.headline).foregroundColor(.black)
                    Text("8.0 小時").foregroundColor(.black)
                 }
               }
            .padding(.bottom)
             Spacer()
             }
            .padding(20)
            Spacer()
            }
        .navigationBarTitle(Text("請假"))
        }
    }
}

struct CreateDayOffView_Previews: PreviewProvider {
    static var previews: some View {
        CreateDayOffView()
    }
}
