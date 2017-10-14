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
    let fullName: String
    let owner: User
    
    init(json: Any) throws {
        guard let dictionaly = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let id = dictionaly["id"] as? Int else {
            throw JSONDecodeError.missingValue(key: "id", actualValue: dectionaly["id"])
        }
        
        guard  let name = dictinaly["name"] as? String else {
            throw JSONDecodeError.missingValue(key: "name", actualValue: dectinaly["name"])
        }
        
        guard let fullName = dictionaly["fullName"] as? String else {
            throw JSONDecodeError.missingValue(key: "fullName", actualValue: dictionaly["fullName"])
        }
        
        guard let owner = dictionaly["owner"] else {
            throw JSONDecodeError.missingValue(key: "owner", actualValue: dictionaly["owner"])
        }
        
        self.id = id
        self.name = name
        self.fullName = fullName
        self.owner = owner
    }
}
