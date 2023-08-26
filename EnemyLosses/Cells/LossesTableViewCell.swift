//
//  LossesTableViewCell.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import UIKit

class LossesTableViewCell: UITableViewCell {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let dateLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nonReusableViews: [UIView] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            mainStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -20)
        ])
        
        mainStackView.addArrangedSubview(dateLabel)
        mainStackView.setCustomSpacing(10, after: dateLabel)
    }
    
    func configure(losses: Losses, dateFormatter: DateFormatter) {
        
        nonReusableViews.forEach{$0.removeFromSuperview()}
        
        dateLabel.text = dateFormatter.string(from: losses.date)
        
        for item in losses.items where item.amount != nil {
            let itemView = ItemView()
            itemView.configure(item: item)
            nonReusableViews.append(itemView)
            mainStackView.addArrangedSubview(itemView)
        }
        
        if let greatestLossesDirection = losses.greatestLossesDirection, greatestLossesDirection.isEmpty == false {
            
            let greatestLossesDirectionLabel: UILabel = UILabel()
            greatestLossesDirectionLabel.text = "Greatest losses direction: " + greatestLossesDirection
            greatestLossesDirectionLabel.numberOfLines = 0
            greatestLossesDirectionLabel.translatesAutoresizingMaskIntoConstraints = false
            
            nonReusableViews.append(greatestLossesDirectionLabel)
            mainStackView.addArrangedSubview(greatestLossesDirectionLabel)
        }
    }
}
