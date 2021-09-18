//
//  QuestionViewController.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var btAnswer: UIButton!
    @IBOutlet var lbQuestion: UILabel!
    @IBOutlet var lbTableTitle: UILabel!
    @IBOutlet var tvAlternatives: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        setLayout()
    }
    
    fileprivate func setLayout(){
        title = Strings.navigationBarTitle
        btAnswer.layer.cornerRadius = btAnswer.bounds.size.height.half
        btAnswer.setTitle(Strings.ButtonTitle.answer,
                          for: .normal)
        btAnswer.isEnabled = false
    }
    
    fileprivate func setupTableview() {
        tvAlternatives.dataSource = self
        tvAlternatives.delegate = self
        tvAlternatives.register(UINib(nibName: AlternativeTableViewCell.nibName,
                                      bundle: nil),
                                forCellReuseIdentifier: AlternativeTableViewCell.cellReuseIdentifier)
        tvAlternatives.rowHeight = 60
    }
}

extension QuestionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlternativeTableViewCell.cellReuseIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = "Alternativa"
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    
}




