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
}

class AlternativeTableViewCell: UITableViewCell {
    static let nibName = "AlternativeTableViewCell"
    static let cellReuseIdentifier = "AlternativeTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setupLayout(){
        layer.cornerRadius = Layout.cornerRadius
        layer.borderWidth = Layout.borderWidth
        layer.borderColor = Colors.lightGray.cgColor
    }
    
    func setupLayout(for type: AlternativeTableViewCellType){
        switch type {
        case .selected:
            backgroundColor = Colors.primary
            layer.borderColor = Colors.primary.cgColor
        case .correct:
            backgroundColor = Colors.lightGreen
            layer.borderColor = Colors.green.cgColor
        case .wrong:
            backgroundColor = Colors.secondary
            layer.borderColor = Colors.secondary.cgColor
        }
    }
        
    override var isSelected: Bool {
        didSet{
            isSelected ? print("selected") : print("not selected")
        }
    }
    
    
}
