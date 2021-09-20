//
//  HomeViewController.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var lbTitle: UILabel!
    @IBOutlet var lbSubtitle: UILabel!
    @IBOutlet var btStart: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setLayout()
    }
    
    //MARK:-Layout
    fileprivate func setNavigationController(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Colors.primary
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationItem.backButtonTitle = "voltar"
    }
    
    fileprivate func setLayout(){
        title = Strings.navigationBarTitle
        lbTitle.text = Strings.StartScene.title
        lbSubtitle.text = Strings.StartScene.subtitle
        btStart.setTitle(Strings.ButtonTitle.start,
                         for: .normal)
        btStart.layer.cornerRadius = btStart.bounds.size.height.half
        containerView.layer.cornerRadius = Layout.containerCornerRadius
        containerView.layer.borderWidth = Layout.borderWidth
        containerView.layer.borderColor = Colors.lightGray.cgColor
    }
    
    @IBAction func start(_ sender: UIButton) {
        let questionViewController = QuestionViewController()
        navigationController?.pushViewController(questionViewController,
                                                 animated: true)
    }
    
}
