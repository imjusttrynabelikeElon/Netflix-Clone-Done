//
//  SearchResultsViewController.swift
//  Netflix Clone
//
//  Created by Karon Bell on 4/24/23.
//

import UIKit


protocol SearchResultsViewControllerDelgate: AnyObject {
    func SearchResultsViewControllerDidTapItem(_ viewModel: TitlePreviewViewModel)
}

class SearchResultsViewController: UIViewController {


  public var titles: [Title] = [Title]()
    
    public weak var delgate: SearchResultsViewControllerDelgate?
    
   public let searchResultsCollectionView: UICollectionView = {
        
       let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.id)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
    
 
}



 extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.id, for: indexPath) as? TitleCollectionViewCell else {
             return UICollectionViewCell()
         }
       
         let title = titles[indexPath.row]
         cell.configure(with: title.poster_path ?? "")
         
         return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         collectionView.deselectItem(at: indexPath, animated: true)
         
         let title = titles[indexPath.row]
         let titleName = title.original_title ?? ""
         
         APICaller.shared.getMovieWebQuery(with: titleName) { [weak self] result in
             switch result {
             case .success(let videoElement):
                 self?.delgate?.SearchResultsViewControllerDidTapItem(TitlePreviewViewModel(title: title.original_title ?? "", youtubeVideo: videoElement, titleOverview: title.overview ?? ""))
               
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
         
         
     }
}
