//
//  BannerCell.swift
//  TableKit
//
//  Created by 方林威 on 2022/3/25.
//

import UIKit

class BannerCell: UITableViewCell {
    
    private lazy var coverImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        contentView.addSubview(coverImageView)
        coverImageView.fillToSuperview()
        
        coverImageView.layer.cornerRadius = 10
        coverImageView.layer.masksToBounds = true
    }
}

extension BannerCell: ConfigurableCell {
    typealias Data = String
    
    func configure(with data: Data) {
        coverImageView.image = .init(named: data)
    }
}
