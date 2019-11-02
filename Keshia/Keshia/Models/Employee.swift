//
//  Employee.swift
//  Keshia
//
//  Created by 賴宜賢 on 2019/11/2.
//  Copyright © 2019 Keshia. All rights reserved.
//

import Foundation

final class Employee: Codable {
    var fullName: String
    var email: String
    init(fullName:String, email:String) {
        self.fullName = fullName
        self.email = email
    }
}
