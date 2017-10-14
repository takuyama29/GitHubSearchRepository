//
//  GithubAPIError.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

struct GithubAPIError: JSONDecodable, Error {
    struct FieldError: JSONDecodable {
        let resource: String
        let field: String
        let code: String
    
        init(json: Any) throws {
            guard let dictionaly = json as? [String: Any] else {
                throw JSONDecodeError.invalidFormat(json: json)
            }
            
            guard let resource = dictionaly["resource"] as? String else {
                throw JSONDecodeError.missingValue(key: "resource", actualValue: dictionaly["resource"])
            }
            
            guard let field = dictionaly["field"] as? String else {
                throw JSONDecodeError.missingValue(key: "field", actualValue: dictionaly["field"])
            }
            
            guard let code = dictionaly["code"] as? String else {
                throw JSONDecodeError.missingValue(key: "code", actualValue: dictionaly["code"])
            }
            
            self.resource = resource
            self.field = field
            self.code = code
        }
    }
    
    let message: String
    let fieldErrors: [FieldError]
    
    init(json: Any) throws {
        guard let dictionaly = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let message = dictionaly["message"] as? String else {
            throw JSONDecodeError.missingValue(key: "message", actualValue: dictionaly["message"])
        }
        
        let fieldErrorObjects = dictionaly["errors"] as? [Any] ?? []
        let fieldErrors = try fieldErrorObjects.map {
            return try FieldError(json: $0)
        }
        
        self.message = message
        self.fieldErrors = fieldErrors
    }
}
