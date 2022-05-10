//
//  SearchResultsVC.swift
//  ChallengeApp
//
//  Created by ugur-pc on 10.05.2022.
//

import Foundation
import UIKit


class SearchResultsVC: UIViewController {
    
    var searchArr: [HomeMovieSearchProtocol]?
    
    private let tableView: UITableView =  {
        let table = UITableView()
        table.register(SearchTableCell.self, forCellReuseIdentifier: SearchTableCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
       
        
     }
    
    private func setupViews() {
        view.addSubview(tableView)
        tableView.fillSuperview()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        HomeVC.searchClosure = { itemArr in
            self.searchArr = itemArr
            self.tableView.reloadData()
        }
    }
}

//MARK: -
extension SearchResultsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchArr?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableCell.identifier, for: indexPath) as? SearchTableCell else {
            return UITableViewCell()
        }
       
        cell.fillSearchData(for: self.searchArr?[indexPath.row] as! HomeMovieSearchProtocol)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
