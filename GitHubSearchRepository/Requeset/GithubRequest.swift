//
//  GithubRequest.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

protocol GithubRequest {
    var baseURL: URL { get
    }
}

extension GithubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")
    }
}
