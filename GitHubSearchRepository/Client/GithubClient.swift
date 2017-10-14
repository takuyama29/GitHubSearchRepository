//
//  GithubClient.swift
//  GitHubSearchRepository
//
//  Created by 山田卓 on 2017/10/14.
//  Copyright © 2017 TakuYamada. All rights reserved.
//

import Foundation

class GithubClient { // HTTPクライアントのセッションの管理
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    // APIクライアントのインターフェース定義
    func send<Request: GithubRequest>(
        request: Request,
        completion: @escaping (Result<Request.Response, GithubClientError>) -> Void) {
        // escaping属性を加えているのはdataTask(with: complitionHandler:)メソッドの
        // 第二引数にescapingが指定されているため
        
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
            
            switch (data, response, error) {
            case (_, _, let error?): // errorがnilじゃない場合(=error発生)
                completion(Result(error: .connectionError(error)))
                
            case (let data?, let response?, _):// errorがnilの場合(=error発生せず)
                do {
                    let response = try request.response(
                        from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination \(data), \(response), \(error).")
            }
        }
        
        task.resume()
    }
}
