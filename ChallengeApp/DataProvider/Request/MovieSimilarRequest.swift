//
//  MovieSimilarRequest.swift
//  ChallengeApp
//
//  Created by ugur-pc on 9.05.2022.
//

import Foundation

public struct MovieSimilarRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = MovieNowPlayingModel?
    public var path: String = "/movie/{movieId}/similar"
    public var method: RequestMethod = .get
    
    public init(movieId: Int) {
        path = "/movie/\(movieId)/similar"
    }
}
