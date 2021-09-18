//
//  AlternativeTableViewCell.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import UIKit

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
        accessoryType = .disclosureIndicator
    }
    
    
}
