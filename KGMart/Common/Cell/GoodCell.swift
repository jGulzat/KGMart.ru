//
//  GoodCell.swift
//  KGMart
//
//  Created by Gulzat on 17/11/23.
//

import UIKit

class GoodCell: UITableViewCell {

    private let bgView = UIView()
    
    private let goodImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let goodNameValueLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goodNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "Наименование"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goodCountValueLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let goodCountLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Количество"
        return label
    }()
    
    private let goodBrandLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureBGView()
        configureGoodBrandLabel()
        configureGoodImage()
        configureGoodNameLabel()
        configureGoodNameValueLabel()
        configureGoodCountLabel()
        configureGoodCountValueLabel()
    }
    
    private func configureBGView() {
        contentView.addSubview(bgView)
    
        bgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bgView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureGoodBrandLabel() {
        bgView.addSubview(goodBrandLabel)
        
        NSLayoutConstraint.activate([
            goodBrandLabel.topAnchor.constraint(equalTo: bgView.topAnchor),
            goodBrandLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor)
        ])
    }
    
    private func configureGoodImage() {
        bgView.addSubview(goodImage)
        
        NSLayoutConstraint.activate([
            goodImage.topAnchor.constraint(equalTo: goodBrandLabel.bottomAnchor, constant: 8),
            goodImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 20),
            goodImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -20),
            goodImage.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureGoodNameLabel() {
        bgView.addSubview(goodNameLabel)
        
        NSLayoutConstraint.activate([
            goodNameLabel.topAnchor.constraint(equalTo: goodImage.bottomAnchor, constant: 8),
            goodNameLabel.leadingAnchor.constraint(equalTo: goodImage.leadingAnchor),
        ])
    }
    
    private func configureGoodNameValueLabel() {
        bgView.addSubview(goodNameValueLabel)
        
        NSLayoutConstraint.activate([
            goodNameValueLabel.topAnchor.constraint(equalTo: goodNameLabel.bottomAnchor, constant: 2),
            goodNameValueLabel.leadingAnchor.constraint(equalTo: goodImage.leadingAnchor),
        ])
    }
    
    private func configureGoodCountLabel() {
        bgView.addSubview(goodCountLabel)
        
        NSLayoutConstraint.activate([
            goodCountLabel.topAnchor.constraint(equalTo: goodNameLabel.topAnchor),
            goodCountLabel.trailingAnchor.constraint(equalTo: goodImage.trailingAnchor, constant: -12)
        ])
    }
    
    private func configureGoodCountValueLabel() {
        bgView.addSubview(goodCountValueLabel)
        
        NSLayoutConstraint.activate([
            goodCountValueLabel.topAnchor.constraint(equalTo: goodCountLabel.bottomAnchor, constant: 2),
            goodCountValueLabel.trailingAnchor.constraint(equalTo: goodImage.trailingAnchor, constant: -12)
        ])
    }
    
    func setCellData(_ good: Good){
        goodImage.image = UIImage(named: good.image)
        goodNameValueLabel.text = good.name
        goodBrandLabel.text = good.brand
        goodCountValueLabel.text = String(good.count)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
