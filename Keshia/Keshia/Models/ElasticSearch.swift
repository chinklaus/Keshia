//
//  ElasticSearch.swift
//  Keshia
//
//  Created by 賴宜賢 on 2019/11/2.
//  Copyright © 2019 Keshia. All rights reserved.
//

import Foundation
final class ElasticSearch: Codable{
    var query: query
    init(query: query) {
        self.query = query
    }
}
