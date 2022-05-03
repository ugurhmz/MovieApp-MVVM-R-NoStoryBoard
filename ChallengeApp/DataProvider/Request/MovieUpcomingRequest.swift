//
//  MovieUpcomingRequest.swift
//  ChallengeApp
//
//  Created by ugur-pc on 4.05.2022.
//

import Foundation

public struct MovieUpcomingRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = MovieUpComingModel?
    
    public var path: String = "/movie/upcoming"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(page: Int?){
        self.parameters["page"] = page
    }
}
