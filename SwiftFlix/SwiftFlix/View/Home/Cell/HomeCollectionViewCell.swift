//
//  HomeCollectionViewCell.swift
//  SwiftFlix
//
//  Created by Larissa de Souza Lanes Goncalves on 13/10/22.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeCollectionViewCell"
    
    let imgAvatar : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ok"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgAvatar)
        self.imgAvatar.addSubview(label)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgAvatar.frame = contentView.frame
    }

    func configureCell(movie: MoviesData){
        imgAvatar.image = UIImage(named: "")
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)"){
            imgAvatar.kf.setImage(with: url)
        }else {
            imgAvatar.image = nil
        }
        
        label.text = movie.title
    }

}

