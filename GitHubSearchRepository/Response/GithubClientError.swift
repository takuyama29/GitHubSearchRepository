//
//  GithubClientError.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

enum GithubClientError: Error {
    // 通信に失敗したケース
    case connectionError(Error)
    
    // レスポンスの解釈に失敗したケース
    case responseParseError(Error)
    
    // APIからエラーレスポンスを受け取ったケース
    case apiError(Error)
    // FIXME
    // case apiError(GithubAPIError)
}
