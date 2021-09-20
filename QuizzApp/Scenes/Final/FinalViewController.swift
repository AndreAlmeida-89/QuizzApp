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
    @IBOutlet weak var btReset: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    fileprivate func setLayout(){
        title = Strings.navigationBarTitle
        lbTitle.text = Strings.FinalScene.title
        lbSubtitle.text = Strings.FinalScene.subtitle
        lbResult.text = Strings.FinalScene.correct(QuestionManager._totalCorrectAnswers,
                                                   QuestionManager._totalAnswers)
        btReset.setTitle(Strings.ButtonTitle.tryAgain,
                         for: .normal)
        containerView.layer.cornerRadius = Layout.containerCornerRadius
        containerView.layer.borderWidth = Layout.borderWidth
        containerView.layer.borderColor = Colors.lightGray.cgColor
    }

    @IBAction func reset(_ sender: UIButton) {
        QuestionManager.reset()
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController,
                                                 animated: true)
    }
}
