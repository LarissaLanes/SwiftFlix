//
//  CollectionHomeTableViewCell.swift
//  SwiftFlix
//
//  Created by Larissa de Souza Lanes Goncalves on 13/10/22.
//

import UIKit

class CollectionHomeTableViewCell: UITableViewCell {
        
    @IBOutlet weak var collection: UICollectionView!
    
    var data: [MoviesData]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 160)
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        collection.setCollectionViewLayout(layout, animated: false)
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
}

extension CollectionHomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        cell.configureCell(movie: data[indexPath.row] )
        
        return cell
    }
}
