//
//  GithubAPIError.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

struct GithubAPIError: JSONDecodable, Error {
    let message: String
    
    init(json: Any) throws {
        guard let dictionaly = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let message = dictionaly["message"] as? String else {
            throw JSONDecodeError.missingValue(key: "message", actualValue: dictionaly["message"])
        }
        
        self.message = message
    }
}
