//
//  GithubClientError.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

enum GithubClienrError: Error {
    // 通信に失敗したケース
    case connectionError(Error)
    
    // レポポンスの解釈に失敗したケース
    case responseParseError(Error)
    
    // APIからエラーレスポンスを受け取ったケース
    case apiError(GithubClienrError)
}
