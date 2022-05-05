//
//  HomeBottomTableCell.swift
//  ChallengeApp
//
//  Created by ugur-pc on 5.05.2022.
//

import UIKit

class HomeBottomCell: UICollectionViewCell {

    static var identifier = "HomeBottomTableCell"
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        //register
        tableView.register(HomeBottomTableCell.self,
                           forCellReuseIdentifier: HomeBottomTableCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
    private func setupViews(){
        contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

//MARK: - Constraints
extension HomeBottomCell {
    private func setConstraints(){
        tableView.fillSuperview()
    }
}

//MARK: - Delegate, DataSource
extension HomeBottomCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 17
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeBottomTableCell.identifier, for: indexPath) as? HomeBottomTableCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = UIColor(hue: drand48(),
                                       saturation: 1,
                                       brightness: 1,
                                       alpha: 1)
       return cell
    }
       
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
   }
}
