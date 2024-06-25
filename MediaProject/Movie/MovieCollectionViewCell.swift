//
//  MovieCollectionViewCell.swift
//  MediaProject
//
//  Created by 최민경 on 6/11/24.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    
    let movieImage: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(movieImage)
        movieImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: Movie) {
//        guard let poster = data.poster_path else { return }
         let poster = data.poster_path 
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(poster)")
        movieImage.kf.setImage(with: url)
    }
}
