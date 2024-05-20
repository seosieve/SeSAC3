//
//  NewWordViewController.swift
//  SeSAC3
//
//  Created by 서충원 on 5/19/24.
//

import UIKit

class NewWordViewController: UIViewController {

    let newWordArr = ["슬픔": "悲しみ, 哀れ, 悲嘆.", "기쁨": "喜び, うれしさ.", "즐거움":"楽しみ, 楽しさ.", "그리움":"恋しさ, 懐かしさ.", "우울함":"憂うつさ"]
    var savedWordArr = [String]()
    
    @IBOutlet var borderContainerView: UIView!
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var newWordButtonCollection: [UIButton]!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        view.addGestureRecognizer(tap)
        setViews()
    }
    
    func setViews() {
        borderContainerView.layer.borderWidth = 3
        borderContainerView.layer.borderColor = UIColor.black.cgColor
        
        for i in 0..<newWordButtonCollection.count {
            let button = newWordButtonCollection[i]
            button.addTarget(self, action: #selector(newWordButtonPressed), for: .touchUpInside)
            button.tag = i
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.tintColor = .black
            button.isHidden = true
        }
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchLogic(wordTextField.text)
        view.endEditing(true)
    }
    
    @IBAction func wordTextFieldReturnAction(_ sender: UITextField) {
        searchLogic(sender.text)
    }
    
    @objc func newWordButtonPressed(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        wordTextField.text = text
        print(text)
    }
    
    func searchLogic(_ keyboardInput: String?) {
        let input = keyboardInput ?? ""
        if let output = newWordArr[input] {
            resultLabel.text = output
            if savedWordArr.count < 5 && !savedWordArr.contains(input) {
                savedWordArr.append(input)
                savingLogic()
            }
        } else {
            resultLabel.text = "結果が見つかりません."
        }
    }
    
    func savingLogic() {
        for i in 0..<newWordButtonCollection.count {
            let button = newWordButtonCollection[i]
            if i < savedWordArr.count {
                button.setTitle(savedWordArr[i], for: .normal)
                button.isHidden = false
            }
        }
    }
}
