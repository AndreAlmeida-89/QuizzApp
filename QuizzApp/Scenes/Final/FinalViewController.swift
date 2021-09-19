//
//  FinalViewController.swift
//  QuizzApp
//
//  Created by André Felipe de Sousa Almeida - AAD on 19/09/21.
//

import UIKit

class FinalViewController: UIViewController {
    @IBOutlet var containerView: UIView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbSubtitle: UILabel!
    @IBOutlet var lbResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    fileprivate func setLayout(){
        title = Strings.navigationBarTitle
        lbTitle.text = Strings.StartScene.title
        lbSubtitle.text = Strings.StartScene.subtitle
        containerView.layer.cornerRadius = Layout.cornerRadius
        containerView.layer.borderWidth = Layout.borderWidth
        containerView.layer.borderColor = Colors.lightGray.cgColor
    }

}
