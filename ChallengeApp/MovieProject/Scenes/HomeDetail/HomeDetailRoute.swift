//
//  HomeDetailRoute.swift
//  ChallengeApp
//
//  Created by ugur-pc on 7.05.2022.
//

protocol HomeDetailRoute {
    func pushHomeDetail(movieId: Int)
}

extension HomeDetailRoute where Self: RouterProtocol {
    
    // TODO Eksik kısımlar var, sırası gelince düzelt
    func pushHomeDetail(movieId: Int) {
        let router = HomeDetailRouter()
        let viewModel = HomeDetailViewModel()
        let viewController = HomeDetailVC()
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
