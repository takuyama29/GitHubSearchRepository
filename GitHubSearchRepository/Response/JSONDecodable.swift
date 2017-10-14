//
//  JSONDecodable.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    init(json: Any) throws
}

// このプロトコルを定義することで、JSONを受け取る型は下記の様なジェネリック関数を用いデコードが可能となる
/*
 fucn decode<T: JSONDecodable>(json: Any) throw -> T {
     return try T(json: json)
 }
 */

