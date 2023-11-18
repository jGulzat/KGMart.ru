//
//  FabricatorCell.swift
//  KGMart
//
//  Created by Gulzat on 18/11/23.
//

import UIKit

class FabricatorCell: UITableViewCell {

    private let bgView = UIView()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fabricatorNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rigthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureBGView()
        configureIconImageView()
        configureFabricatorNameLabel()
        configureRigthImageView()
    }
    
    private func configureBGView() {
        contentView.addSubview(bgView)
        bgView.backgroundColor = .cyan
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func configureIconImageView() {
        bgView.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: bgView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureFabricatorNameLabel() {
        bgView.addSubview(fabricatorNameLabel)
        
        NSLayoutConstraint.activate([
            fabricatorNameLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            fabricatorNameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12)
        ])
    }
    
    private func configureRigthImageView() {
        bgView.addSubview(rigthImageView)
        
        NSLayoutConstraint.activate([
            rigthImageView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            rigthImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
           rigthImageView.heightAnchor.constraint(equalToConstant: 16),
            rigthImageView.widthAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func setCellData(_ fabricatorName: String, _ logo: String) {
        fabricatorNameLabel.text = fabricatorName
        iconImageView.image = UIImage(named: logo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
