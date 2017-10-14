//
//  SearchResponse.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

struct SearchResponse<Item: JSONDecodable>: JSONDecodable {
    let totalCount: Int
    let items: [Item]
    
    init(json: Any) throws {
        guard  let dictionaly = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let totalCount = dictionaly["total_count"] as? Int else {
            throw JSONDecodeError.missingValue(key: "total_count", actualValue: dictionaly["total_count"])
        }
        
        guard let itemObject = dictionaly["items"] as? [Any] else {
            throw JSONDecodeError.missingValue(key: "items", actualValue: dictionaly["items"])
        }
        
        let items = try itemObject.map {
            return try Item(json: $0)
        }
        
        self.totalCount = totalCount
        self.items = items
    }
}
