//
//  HomeDetailVC.swift
//  ChallengeApp
//
//  Created by ugur-pc on 7.05.2022.
//

import UIKit

class HomeDetailVC: BaseViewController<HomeDetailViewModel> {

    private let navigationBar : UINavigationBar = {
            let navBar = UINavigationBar()
            let navigationItem =  UINavigationItem()
            let button = UIBarButtonItem()
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.configureWithOpaqueBackground()
            standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            standardAppearance.backgroundColor = .white
            navigationItem.standardAppearance = standardAppearance
            navigationItem.scrollEdgeAppearance = standardAppearance
            navigationItem.compactAppearance = standardAppearance
            
            let buttonAppearance = UIBarButtonItemAppearance()
            buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black,.font : UIFont.systemFont(ofSize:20, weight: .bold)]
            button.tintColor = .black
            navigationItem.standardAppearance?.buttonAppearance = buttonAppearance
            navigationItem.compactAppearance?.buttonAppearance = buttonAppearance
            
            button.image = UIImage(systemName: "arrowshape.turn.up.left")
            button.action = #selector(backToHomePageBtn)
            
            
            navigationItem.title =  "Ger"
            navigationItem.leftBarButtonItem = button
            navBar.setItems([navigationItem], animated: false)
            return navBar
    }()
    
    private let generalCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: HomeDetailVC.createCompositionalLayout())
            cv.backgroundColor = .white
            cv.translatesAutoresizingMaskIntoConstraints = false
            
            // register
            cv.register(UICollectionViewCell.self,
                        forCellWithReuseIdentifier: "cellId")
           
            cv.register(HeaderReusableView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier:   HeaderReusableView.identifier)
            
            cv.register(SimilarMovieCollectionCell.self, forCellWithReuseIdentifier: SimilarMovieCollectionCell.identifier)
            return cv
   }()
    
    
    
    
    
    
    //MARK: - createCompositionalLayout
      static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
          let mylayout = UICollectionViewCompositionalLayout {  (index, environment) -> NSCollectionLayoutSection? in
             
              return  HomeDetailVC.createSectionFor(index: index, environment: environment)
           }
           
           return mylayout
       }
    
    static func createSectionFor(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
           
           switch index {
           case 0:
               return createSecondSection()
         
           default:
               return  createSecondSection()
           }
       }
    
    //MARK: - SECOND SECTION
     static func createSecondSection() -> NSCollectionLayoutSection {
         
         let inset: CGFloat = 3
         
         // item
         let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                               heightDimension: .fractionalHeight(1))
         
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         item.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                      leading: inset,
                                                      bottom: inset,
                                                      trailing: inset)
         
         // group
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
                                                heightDimension: .fractionalHeight(0.70))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                        subitem:  item, count: 2)
         
         // section
         let section = NSCollectionLayoutSection(group: group)
         section.orthogonalScrollingBehavior = .continuous
         
         
         // suplementary
         let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(45))
         
         let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                  elementKind: "header",
                                                                  alignment: .top)
         section.boundarySupplementaryItems = [header]
         return section
     }
    
    
    // movie image
    private let movieImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"v4")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    // movie image
    private let imdbImageIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"imdbIcon")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    // movie image
    private let starIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName:"star.fill")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .systemYellow
        return iv
    }()
    
    //  rate label
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "7.8/10"
        label.textColor = .black
      
        return label
    }()
   
    
    private let circleIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName:"circle.fill")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .myRGB(red: 215, green: 175, blue: 15)
        return iv
    }()
    

    // relase date label
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "26-04-1994"
        label.textColor = .black
        return label
    }()

    // relase date label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.text = "Harry Potter 2013"
        label.textColor = .black
        return label
    }()

    
    // relase date label
    private let overviewLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        
        generalCollectionView.dataSource = self
        generalCollectionView.delegate = self
               
        generalCollectionView.collectionViewLayout =  HomeDetailVC.createCompositionalLayout()
        setConstraints()
    }
    
  @objc func backToHomePageBtn(){
       dismiss(animated: true, completion: nil)
   }

}



//MARK: - Delegate,DataSource
extension HomeDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    // numberOfSections
       func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
       
    // numberOfItemsInSection
      func collectionView(_ collectionView: UICollectionView,
                          numberOfItemsInSection section: Int) -> Int {
          
          
          return 10
      }
    
    // cellForItemAt
        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = generalCollectionView.dequeueReusableCell(withReuseIdentifier: "cellId",
                                                                 for: indexPath)
            
            if indexPath.section == 0 {
                let cell = generalCollectionView.dequeueReusableCell(withReuseIdentifier: SimilarMovieCollectionCell.identifier, for: indexPath) as! SimilarMovieCollectionCell
               
                cell.backgroundColor = UIColor(hue: CGFloat(drand48()),
                                                saturation: 1,
                                                brightness: 1,
                                                alpha: 1)
                cell.layer.cornerRadius = 20
                return cell
            }
            return cell
        }
    // viewForSupplementaryElementOfKind
     func collectionView(_ collectionView: UICollectionView,
                         viewForSupplementaryElementOfKind kind: String,
                         at indexPath: IndexPath) -> UICollectionReusableView {
         
         let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: HeaderReusableView.identifier, for: indexPath) as! HeaderReusableView
         
         if indexPath.section == 0{
             view.titleLabel.text = "Benzer Filmler"
         }
         return view
     }
    
}




//MARK: - Constraints
extension HomeDetailVC {
    
    private func setupViews(){
        [navigationBar,movieImageView,imdbImageIcon,starIcon,circleIcon,rateLabel,releaseDateLabel].forEach{ view.addSubview($0)}
        
        view.addSubview(titleLabel)
        view.addSubview(overviewLbl)
        view.addSubview(generalCollectionView)
    }
    
    
    private func setConstraints(){
        navigationBar.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             leading: view.leadingAnchor,
                             bottom: nil,
                             trailing: view.trailingAnchor)
        
        movieImageView.anchor(top: navigationBar.bottomAnchor,
                              leading: view.leadingAnchor,
                              bottom: nil,
                              trailing: view.trailingAnchor,
                              size: .init(width: 0,
                                          height: 330))
        imdbImageIcon.anchor(top: movieImageView.bottomAnchor,
                             leading: view.leadingAnchor,
                             bottom: nil,
                             trailing: nil,
                             padding: .init(top: 15, left: 15, bottom: 0, right: 0),
                             size: .init(width: 70,
                                         height: 34))
        
        starIcon.anchor(top: imdbImageIcon.topAnchor,
                        leading: imdbImageIcon.trailingAnchor,
                        bottom: nil,
                        trailing: nil,
                        padding: .init(top: 4,
                                       left: 15, bottom: 0, right: 0),
                        size: .init(width: 25,
                                    height: 25))
       rateLabel.anchor(top: starIcon.topAnchor,
                        leading: starIcon.trailingAnchor,
                        bottom: nil,
                        trailing: nil,
                        padding: .init(top: 0,
                                       left: 5, bottom: 0, right: 0),
                        size: .init(width: 50,
                                    height: 25))
        circleIcon.anchor(top: rateLabel.topAnchor,
                          leading: rateLabel.trailingAnchor,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 8,
                                         left: 4, bottom: 0, right: 0),
                          size: .init(width: 8,
                                      height: 8))
       
        releaseDateLabel.anchor(top: starIcon.topAnchor,
                                 leading: circleIcon.trailingAnchor,
                                 bottom: nil,
                                 trailing: nil,
                                 padding: .init(top: 0,
                                                left: 5, bottom: 0, right: 0),
                                 size: .init(width: 120,
                                             height: 25))
        
        titleLabel.anchor(top: imdbImageIcon.bottomAnchor,
                         leading: view.leadingAnchor,
                         bottom: nil,
                        trailing: view.trailingAnchor,
                        padding: .init(top: 16,
                                       left: 15, bottom: 0, right: 15),
                         size: .init(width: 0,
                                     height: 35))
        overviewLbl.anchor(top: titleLabel.bottomAnchor,
                       leading: view.leadingAnchor,
                        bottom: nil,
                       trailing: view.trailingAnchor,
                       padding: .init(top: 11,
                                       left: 15, bottom: 0, right: 15))
        
        generalCollectionView.anchor(top: overviewLbl.bottomAnchor,
                                     leading: view.leadingAnchor,
                                     bottom: view.bottomAnchor,
                                     trailing: view.trailingAnchor,
                                     padding: .init(top: 7,
                                                     left: 5, bottom: 15, right: 0))
    }
}
