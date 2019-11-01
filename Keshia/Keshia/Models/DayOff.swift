//
//  DayOff.swift
//  Keshia
//
//  Created by 賴宜賢 on 2019/10/31.
//  Copyright © 2019 Keshia. All rights reserved.
//

import Foundation

final class DayOff: Codable {
    var staffCode: String
    var noticeMember: [String]
    var noticeSupervisor: String
    var proxy: String
    var reason: String
    var dayOffHours: Int
    var creationDate: String
    var startDate: String
    var endDate: String
    
    init(staffCode: String, noticeMember: [String], noticeSupervisor: String, proxy: String, reason: String, dayOffHours: Int, creationDate: String, startDate: String, endDate: String){
        self.staffCode = staffCode
        self.noticeMember = noticeMember
        self.noticeSupervisor = noticeSupervisor
        self.proxy = proxy
        self.reason = reason
        self.dayOffHours = dayOffHours
        self.creationDate = creationDate
        self.startDate = startDate
        self.endDate = endDate
    }
}
