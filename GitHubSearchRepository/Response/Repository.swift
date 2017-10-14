//
//  Repository.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

struct Repository: JSONDecodable {
    let id: Int
    let name: String
    let full_name: String
    let owner: User
    
    init(json: Any) throws {
        guard let dictionaly = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let id = dictionaly["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dictionaly["id"])
        }
        
        guard  let name = dictionaly["name"] as? String else {
            throw JSONDecodeError.missingValue(key: "name", actualValue: dictionaly["name"])
        }
        
        guard let full_name = dictionaly["full_name"] as? String else {
            throw JSONDecodeError.missingValue(key: "full_name", actualValue: dictionaly["full_name"])
        }
        
        guard let ownerObject = dictionaly["owner"] else {
            throw JSONDecodeError.missingValue(key: "owner", actualValue: dictionaly["owner"])
        }
        
        self.id = id
        self.name = name
        self.full_name = full_name
        self.owner = try User(json: ownerObject)
    }
}
