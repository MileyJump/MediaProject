//
//  CastTableViewCell.swift
//  MediaProject
//
//  Created by 최민경 on 6/12/24.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    let castingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Miley - Happy"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    let explainLabel: UILabel = {
        let label = UILabel()
        label.text = "Jung Ho-Yeon"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .purple
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: Results) {
        
        
//        let url = URL(string: <#T##String#>)
        
    }
    
    func configureHierarchy() {
        contentView.addSubview(castingImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(explainLabel)
    }
    
    func configureLayout() {
        castingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(70)
            make.width.equalTo(castingImageView.snp.height).multipliedBy(0.8)
            make.bottom.equalToSuperview().inset(5)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalTo(castingImageView.snp.trailing).offset(20)
        }
        
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(nameLabel.snp.leading)
            make.bottom.equalToSuperview().inset(15)
        }
    }

}
