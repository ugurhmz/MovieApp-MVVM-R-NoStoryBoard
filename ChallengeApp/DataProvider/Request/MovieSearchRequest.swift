//
//  MovieSearchRequest.swift
//  ChallengeApp
//
//  Created by ugur-pc on 10.05.2022.
//

import Foundation

public struct MovieSearchRequest: APIDecodableResponseRequest {
    public typealias ResponseType = MovieSearchModel?
    
    public var path: String = "/search/movie/"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(searchQuery: String?){
        self.parameters["query"] = searchQuery
    }
}
