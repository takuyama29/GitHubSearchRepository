//
//  HTTPMethod.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    
    // リクエストする際の挙動を指定する型
    // 要求する挙動は排他的に決定されているため列挙型として定義する
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case patch = "PATCH"
    case trace = "TRACE"
    case options = "OPTIONS"
    case connect = "CONNECT"
    
}
