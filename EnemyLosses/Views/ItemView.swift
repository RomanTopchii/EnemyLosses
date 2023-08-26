//
//  ItemView.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 26.08.2023.
//

import UIKit

class ItemView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    init() {
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.addSubview(amountLabel)
        NSLayoutConstraint.activate([
            amountLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor,constant: 10),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            amountLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
        
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        amountLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
    
    func configure(item: Item, showDiffAmount: Bool = false) {
        titleLabel.text = item.name
        
        if item.diff == nil || item.diff == 0 {
            amountLabel.text = String(item.amount!)
        }
        else {
            amountLabel.text = showDiffAmount
            ? "(🔥" + String(item.diff!) + ") " + String(item.amount!)
            : "🔥" + String(item.amount!)
        }
    }
}
