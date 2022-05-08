//
//  HomeTopCellModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 6.05.2022.
//

import UIKit

protocol HomeTopCellDataSource: AnyObject {
    var numberOfItems: Int {get }
    var homeTopCellArr: [HomeSliderCellProtocol] {get set }
    
    func cellItem(for indexPath: IndexPath) -> HomeSliderCellProtocol
}

protocol HomeTopCellEventSource: AnyObject {
    
}

protocol HomeTopCellProtocol: HomeTopCellDataSource, HomeTopCellEventSource {
    
}

//MARK: -
final class HomeTopCellModel: HomeTopCellProtocol {
    var homeTopCellArr: [HomeSliderCellProtocol] = []
    
    var numberOfItems: Int {
        return homeTopCellArr.count
    }
    
    func cellItem(for indexPath: IndexPath) -> HomeSliderCellProtocol {
        return homeTopCellArr[indexPath.row]
    }
    
    init(homeHeaderCellValues: [HomeSliderCellProtocol]){
        self.homeTopCellArr = homeHeaderCellValues
    }
    
}
