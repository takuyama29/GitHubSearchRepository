//
//  User.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

struct User { // JSONを受け取ってユーザー情報をインスタンス化するための型
    let id: Int
    let login: String
    
    // JSONのフォーマットに合わせてイニシャライズする
    init(json: Any) throws { // JSONが意図しないフォーマットになった場合に例外が発生しうるのでthrow文を使う
        guard let dictionaly = json as? [String :  Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        guard let id = dictionaly["id"] as? Int else {
            throw JSONDecodeError.missingValue(
                key: "id", actualValue: dictionaly["id"])
        }
        
        guard let login = dictionaly["login"] as? String else {
            throw JSONDecodeError.missingValue(key: "login", actualValue: dictionaly["login"])
        }
        
        self.id = id
        self.login = login
    }
}
