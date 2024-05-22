//
//  DiaryViewController.swift
//  SeSAC3
//
//  Created by 서충원 on 5/17/24.
//

import UIKit

class DiaryViewController: UIViewController {

    let userDefaults = UserDefaults.standard
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
        
        for i in 0..<numberLabelCollection.count {
            let label = numberLabelCollection[i]
            label.tag = i
            let count = userDefaults.integer(forKey: labelTitle[i])
            
            if count != 0 {
                label.text = "\(labelTitle[i]) \(count)"
            } else {
                label.text = labelTitle[i]
            }
        }
    }
    
    //TapGesture -> Action
    @IBAction func slimeButtonPressed(_ sender: UIButton) {
        let number = userDefaults.integer(forKey: labelTitle[sender.tag])
        userDefaults.set(number+1, forKey: labelTitle[sender.tag])
        numberLabelCollection[sender.tag].text = "\(labelTitle[sender.tag]) \(number+1)"
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        for key in userDefaults.dictionaryRepresentation().keys {
            userDefaults.removeObject(forKey: key.description)
        }
        setViews()
    }
}
