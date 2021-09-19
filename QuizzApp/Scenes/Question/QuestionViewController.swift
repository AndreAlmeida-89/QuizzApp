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
    
    private var questionManager = QuestionManager()
    var selectedCell: AlternativeTableViewCell?
    
    
    @IBAction func answer(_ sender: UIButton) {
        guard let chosenAnswer = selectedCell?.textLabel?.text else {return}
        let isCorrect = questionManager.chooseAnswer(chosenAnswer)
        isCorrect! ? selectedCell?.setupLayout(for: .correct) : selectedCell?.setupLayout(for: .wrong)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        setLayout()
    }
    
    fileprivate func setLayout(){
        title = Strings.navigationBarTitle
        lbQuestion.text = questionManager.question
        lbTableTitle.text = Strings.QuestionScene.answers
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
    
    fileprivate func ennableButton() {
        guard !btAnswer.isEnabled else {return}
        btAnswer.isEnabled = true
        btAnswer.backgroundColor = Colors.primary
    }
}

extension QuestionViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        questionManager.alternatives.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlternativeTableViewCell.cellReuseIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = questionManager.alternatives[indexPath.row]
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ennableButton()
        selectedCell = tableView.cellForRow(at: indexPath) as? AlternativeTableViewCell
        selectedCell?.setupLayout(for: .selected)
    }
}




