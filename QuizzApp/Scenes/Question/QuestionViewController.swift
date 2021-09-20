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
    private var selectedCell: AlternativeTableViewCell?
    private var correctCellRow: IndexPath?
    
    @IBAction func answer(_ sender: UIButton) {
        guard let chosenAnswer = selectedCell?.textLabel?.text else {return}
        guard let titleText = sender.titleLabel?.text else {return}
        
        switch titleText {
        
        case Strings.ButtonTitle.answer:
            btAnswer.setTitle(Strings.ButtonTitle.nextQuestion,
                              for: .normal)
            tvAlternatives.allowsSelection = false
            let isCorrect = questionManager.chooseAnswer(chosenAnswer)!
            
            if isCorrect {
                selectedCell?.setupLayout(for: .correct)
            } else {
                selectedCell?.setupLayout(for: .wrong)
                
            }
            
        case Strings.ButtonTitle.nextQuestion:
            if QuestionManager._totalAnswers == questionManager.limit {
                let finalViewController = FinalViewController()
                navigationController?.pushViewController(finalViewController,
                                                         animated: true)
                return
            }
            let nextQuestionViewController = QuestionViewController()
            navigationController?.pushViewController(nextQuestionViewController,
                                                     animated: true)
        default:
            return
        }
        
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
        tvAlternatives.separatorStyle = .none
        tvAlternatives.rowHeight = UITableView.automaticDimension
        tvAlternatives.dataSource = self
        tvAlternatives.delegate = self
        tvAlternatives.register(UINib(nibName: AlternativeTableViewCell.nibName,
                                      bundle: nil),
                                forCellReuseIdentifier: AlternativeTableViewCell.cellReuseIdentifier)
        
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
        let cellLable = questionManager.alternatives[indexPath.row]
        cell.textLabel?.text = cellLable
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ennableButton()
        selectedCell = tableView.cellForRow(at: indexPath) as? AlternativeTableViewCell
    }
}




