//
//  GithubRequest.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

protocol GithubRequest {
    
    associatedtype Response: JSONDecodable
    
    var baseURL: URL { get } // リクエストする際のベースとなるURLドメイン
    var path: String { get } // ドメインに続くパス
    var method: HTTPMethod { get } // リクエストする際の形式
    var parameters: Any? { get } // リクエストする際のパラメータ
}

extension GithubRequest {
    
    // リクエストURLは基本的に固定のものなので、ドメインURLをデフォルト値として定義する
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    // リクエストURLを生成するメソッド
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var componets = URLComponents(
            url: url, resolvingAgainstBaseURL: true) // 絶対バスの場合は第二引数はtrue
        
        switch method {
        case .get:
            let dictionaly = parameters as? [String: Any]
            let queryItems = dictionaly?.map { key, value in
                return URLQueryItem(
                    name: key, value: String(describing: value))
            }
            componets?.queryItems = queryItems
            
        default: // .getメソッド以外は使用することを想定していないため、それ以外の場合はエラーを出力させる
            fatalError("Unsuoorted method \(method)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = componets?.url
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    // レスポンスデータを受け取った際の処理
    func response(from data: Data,
                  urlResponse: URLResponse) throws -> Response {
        // 取得したデータをJSONへ変換
        let json = try JSONSerialization.jsonObject(
            with: data, options: [])
        
        // レスポンスのステータスコードが200番台(成功)だった場合
        if case (200..<300)? =
            (urlResponse as? HTTPURLResponse)?.statusCode {
            // JSONからモデルをインスタンス化
            return try Response(json: json)
        } else {
            // JSONからAPIエラーをインスタンス化
            throw try GithubAPIError(json: json)
        }
    }
}

