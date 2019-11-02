//
//  ElasticSearch.swift
//  Keshia
//
//  Created by 賴宜賢 on 2019/11/2.
//  Copyright © 2019 Keshia. All rights reserved.
//

import Foundation
final class ElasticSearch: Codable{
    var min_score: Int
    var query: query

    init(min_score: Int, query: query){
        self.min_score = min_score
        self.query = query
    }
}
