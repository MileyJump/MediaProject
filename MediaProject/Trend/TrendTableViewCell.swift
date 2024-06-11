//
//  TrendTableViewCell.swift
//  MediaProject
//
//  Created by 최민경 on 6/10/24.
//

import UIKit
import Kingfisher
import SnapKit

class TrendTableViewCell: UITableViewCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "12/10/2020"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let hashtag: UILabel = {
        let label = UILabel()
        label.text = "#Mystery"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let trendView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        return view
    }()
    
    let trendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let gradeLabel: UILabel = {
        let label = UILabel()
        label.text = "평점"
        label.textAlignment = .center
        label.backgroundColor = .purple
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "3.3"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Alice in Borderland"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let subTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "kento Yamazaki, Tao Tsuchdakf, nili Morduanfasd"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let learnMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "자세히 보기"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: Results) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.backdrop_path)")
        trendImageView.kf.setImage(with: url)
//        trendImageView.image = UIImage(systemName: "star")
        hashtag.text = "# \(data.media_type)"
        scoreLabel.text = "\(Double(round(data.vote_average)))"
        titleLabel.text = data.title
        subTitleLabel.text = data.overview
    }
    
    func configureHierarchy() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(hashtag)
        contentView.addSubview(trendView)
        contentView.addSubview(trendImageView)
        contentView.addSubview(gradeLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(learnMoreLabel)
        contentView.addSubview(arrowImageView)
    }
    
    func configureLayout() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        hashtag.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(dateLabel)
        }
        
        trendView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(dateLabel)
            make.height.equalTo(trendView.snp.width).multipliedBy(0.9)
            make.top.equalTo(hashtag.snp.bottom).offset(4)
            make.bottom.equalToSuperview().inset(25)
        }
        
        trendImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(trendView)
            make.height.equalTo(trendView.snp.height).multipliedBy(0.6)
        }
        
        gradeLabel.snp.makeConstraints { make in
            make.leading.equalTo(trendImageView.snp.leading).inset(14)
            make.bottom.equalTo(trendImageView.snp.bottom).inset(14)
            make.width.equalTo(30)
            make.height.equalTo(25)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.leading.equalTo(gradeLabel.snp.trailing)
            make.size.equalTo(gradeLabel)
            make.bottom.equalTo(gradeLabel.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(trendImageView.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(trendImageView).inset(14)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.horizontalEdges.equalTo(titleLabel)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(titleLabel)
            make.height.equalTo(1)
        }
        
        learnMoreLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(15)
            make.leading.equalTo(titleLabel)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(learnMoreLabel)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        
        
        
    }
}
