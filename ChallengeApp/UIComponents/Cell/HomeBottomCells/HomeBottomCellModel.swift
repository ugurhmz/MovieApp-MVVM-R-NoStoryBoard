//
//  HomeBottomCellModel.swift
//  ChallengeApp
//
//  Created by ugur-pc on 7.05.2022.
//

import UIKit

protocol HomeBottomCellDataSource: AnyObject {
    var numberOfRowsInSection: Int { get }
    var heightRowAt: CGFloat { get }
    var cellItemsArr: [HomeBottomTableCellProtocol] {get set }
    func cellRowAt(for indexPath: IndexPath) -> HomeBottomTableCellProtocol
}

protocol HomeBottomCellEventSource: AnyObject {
    
}

protocol HomeBottomCellProtocol: HomeBottomCellDataSource, HomeBottomCellEventSource {
    
}


//MARK: -
final class HomeBottomCellModel: HomeBottomCellProtocol {
    
    var numberOfRowsInSection: Int  {
        return  cellItemsArr.count
    }
    
    var heightRowAt: CGFloat  {
        return 150
    }
    
    var cellItemsArr: [HomeBottomTableCellProtocol] = []
    
    func cellRowAt(for indexPath: IndexPath) -> HomeBottomTableCellProtocol {
        return cellItemsArr[indexPath.row]
    }
}
