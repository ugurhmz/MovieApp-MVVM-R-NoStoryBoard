//
//  APIRequestInterceptor.swift
//  ChallengeApp
//
//  Created by ugur-pc on 6.05.2022.
//

import Alamofire
import Foundation

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest,
                      for session: Session,
                      completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var urlRequest = urlRequest
        let accessToken: String? = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZmU4MzcwMjY1YzM5NjY1NmM1OGQ3ZGQ5ZmYzZTcxMiIsInN1YiI6IjYwMmJjMmEwZTcyZmU4MDAzYzExMjYwZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YwgQkSEmflVVLxjfHCr4EXZ6mjD9pUWRYsSaypCxaA8"
        
        if let accessToken = accessToken {
            urlRequest.headers.add(name: "Authorization", value: "Bearer \(accessToken)")
        }
        completion(.success(urlRequest))
    }
}
