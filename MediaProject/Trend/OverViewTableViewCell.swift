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
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    var isExpanded: Bool = false {
            didSet {
                overViewLabel.numberOfLines = isExpanded ? 0 : 2
                arrowIamgeView.image = UIImage(systemName: isExpanded ? "chevron.up" : "chevron.down")
            }
        }
    
    let arrowIamgeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = UIColor.black
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
    
    func configureCell(data: Results, isExpanded: Bool) {
        overViewLabel.text = data.overview
        self.isExpanded = isExpanded
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
//            make.height.equalTo(overViewLabel.font.lineHeight * 2)
        }
        arrowIamgeView.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().inset(8)
            make.centerX.equalToSuperview()
            make.size.equalTo(20)
            
            make.top.equalTo(overViewLabel.snp.bottom).offset(8)
            make.bottom.lessThanOrEqualToSuperview().inset(8)
        }
    }
}
