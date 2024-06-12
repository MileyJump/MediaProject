//
//  OverViewTableViewCell.swift
//  MediaProject
//
//  Created by 최민경 on 6/12/24.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {
    
    
    
    let overViewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    let arrowIamgeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .green
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: Results) {
        overViewLabel.text = data.overview
    }
    
    func configureHierarchy() {
        contentView.addSubview(overViewLabel)
        contentView.addSubview(arrowIamgeView)
    }
    
    func configureLayout() {
        overViewLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        arrowIamgeView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(8)
            make.width.equalTo(arrowIamgeView.snp.height)
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
        }
    }
}
