//
//  WalkThroughRoute.swift
//  ChallengeApp
//
//  Created by ugur-pc on 4.05.2022.
//

protocol WalkThroughRoute {
    func placeOnWindowWalkThrough()
}

extension WalkThroughRoute where Self: RouterProtocol {
    
    func placeOnWindowWalkThrough() {
        let router = WalkThroughRouter()
        let viewController = HomeVC()
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
