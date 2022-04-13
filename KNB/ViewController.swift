//
//  ViewController.swift
//  KNB
//
//  Created by Aleksey Ryabchenko on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var robotButton: UIButton!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var resetStart: UIButton!
    
    @IBOutlet weak var statusLabel: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetStart.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign .smile, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        
        }
        resetStart.isHidden = false
        
        let result = sign.getResult(computerSign)
        
        switch result {
        case .start:
            resultLabel.text = "Поехали!"
            self.resultLabel.textColor = UIColor.red
        case .win:
            resultLabel.text = "Ты победитель:) Ура!"
            self.resultLabel.textColor = UIColor.green
        case .lose:
            resultLabel.text = "Ты проиграл:("
            self.resultLabel.textColor = UIColor.red
        case .draw:
            resultLabel.text = "Ничья!"
            self.resultLabel.textColor = UIColor.gray
        }
    }
    
    func reset() {
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetStart.isHidden = false
        
        resetStart.isHidden = true
    }
    // MARK: - IBAction
    
    @IBAction func rockButtonTouch(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func scissorsButtonTouch(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func paperButtonTouch(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func resetStartTouch(_ sender: Any) {
        reset()
    }
}

