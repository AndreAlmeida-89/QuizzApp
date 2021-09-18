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
    }
    
    fileprivate func setupTableview() {
        tvAlternatives.dataSource = self
        tvAlternatives.delegate = self
        tvAlternatives.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tvAlternatives.estimatedRowHeight = 20
    }
}

extension QuestionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = "Alternativa"
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    
}




