//
//  AlternativeTableViewCell.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import UIKit

enum AlternativeTableViewCellType{
    case correct
    case wrong
    case selected
    case unSelected
}

class AlternativeTableViewCell: UITableViewCell {
    static let nibName = "AlternativeTableViewCell"
    static let cellReuseIdentifier = "AlternativeTableViewCell"
    
    @IBOutlet weak var vwContentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selected ? setupLayout(for: .selected) : setupLayout(for:.unSelected)
    }
    
    fileprivate func setupLayout(){
        vwContentView.layer.cornerRadius = Layout.cellCornerRadius
        vwContentView.layer.borderWidth = Layout.borderWidth
        setupLayout(for: .unSelected)
    }
    
    func setupLayout(for type: AlternativeTableViewCellType){
        switch type {
        case .selected:
            changeCellColor(to: Colors.primaryLight,
                            border: Colors.primary)
        case .correct:
            changeCellColor(to: Colors.lightGreen,
                            border: Colors.green)
        case .wrong:
            changeCellColor(to: Colors.secondaryLight,
                            border: Colors.secondary)
        case .unSelected:
            changeCellColor(to: .white,
                            border: Colors.lightGray)
        }
    }
    
    private func changeCellColor(to background: UIColor, border: UIColor){
        vwContentView.backgroundColor = background
        vwContentView.layer.borderColor = border.cgColor
    }
}
