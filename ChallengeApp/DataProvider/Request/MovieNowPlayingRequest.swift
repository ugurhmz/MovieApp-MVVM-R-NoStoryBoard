//
//  MovieNowPlayingRequest.swift
//  ChallengeApp
//
//  Created by ugur-pc on 4.05.2022.
//

import Foundation

public struct MovieNowPlayingReuqest: APIDecodableResponseRequest {
    
    public typealias ResponseType = MovieNowPlayingModel?
    
    public var path: String = "/movie/now_playing"
    public var method: RequestMethod = .get
    
    public init() {}
}
