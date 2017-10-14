//
//  JSONDecodeError.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

enum JSONDecodeError: Error { // Error protocolに準拠している -> throw文を活用できる
    case invalidFormat(json: Any) // JSONはAny型として表現されている
    case missingValue(key: String, actualValue: Any?)
}
