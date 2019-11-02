//
//  CircleImage.swift .swift
//  Keshia
//
//  Created by 秦士翔 on 2019/10/31.
//  Copyright © 2019 Keshia. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ladysogood")
            .clipShape(Circle())
            .overlay(
            Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
