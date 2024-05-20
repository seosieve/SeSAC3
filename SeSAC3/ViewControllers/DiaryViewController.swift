//
//  DiaryViewController.swift
//  SeSAC3
//
//  Created by 서충원 on 5/17/24.
//

import UIKit

class DiaryViewController: UIViewController {

    let labelTitle = ["幸せだよ", "大好き", "好きだよ", "慌てるよ", "心が痛む", "憂鬱だ", "退屈だ", "感情がない", "恋しい"]
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var slimeButtonCollection: [UIButton]!
    @IBOutlet var numberLabelCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        backgroundImageView.contentMode = .scaleAspectFill
        for i in 0..<slimeButtonCollection.count {
            let button = slimeButtonCollection[i]
            let image = UIImage(named: "slime\(i+1)")?.withRenderingMode(.alwaysOriginal)
            button.setImage(image, for: .normal)
            button.tag = i
        }
    }
    
    //TapGesture -> Action
    @IBAction func slimeButtonPressed(_ sender: UIButton) {
        guard let currentText = numberLabelCollection[sender.tag].text else { return }
        let currentTextArr = currentText.split(separator: " ")
        let number = (currentTextArr.count == 1 ? 0 : Int(currentTextArr[1])!)
        numberLabelCollection[sender.tag].text = "\(labelTitle[sender.tag]) \(number+1)"
    }
}
