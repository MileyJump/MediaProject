//
//  OverViewTableViewCell.swift
//  MediaProject
//
//  Created by 최민경 on 6/12/24.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {
    
    
    
    let overViewLable: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        
    }
    
    func configureHierarchy() {
        contentView.addSubview(overViewLable)
        contentView.addSubview(arrowIamgeView)
    }
    
    func configureLayout() {
        overViewLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        arrowIamgeView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalTo(arrowIamgeView.snp.height)
            make.centerX.equalToSuperview()
            make.top.equalTo(overViewLable.snp.bottom)
        }
    }
}
