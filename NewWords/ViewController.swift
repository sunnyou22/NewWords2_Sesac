//
//  ViewController.swift
//  NewWords
//
//  Created by 방선우 on 2022/07/11.
//

import UIKit

enum NewWordsList: String {
    case 융차 = "안녕"
}

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var hashTagBtns: [UIButton]!
    @IBOutlet weak var descriptionNewWords: UILabel!
    
    var newWordList: Dictionary<String, String> = ["삼귀자": "연애를 시작하기 전 썸 단계!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.black.cgColor
        textField.keyboardType = .default
        
        makeBtnUI(hashTagBtns)
        
    }
    
    func searchNewWords(_ words: UITextField) {
        for i in newWordList {
            if NewWordsList.융차 == words.text { // 타입매칭이 안돼서 사용할 수 없음
                descriptionNewWords.text = NewWordsList.융차.rawValue
            } else {
                descriptionNewWords.text = "시스템 오류입니다😓"
            }
        }
    }
    
    func makeBtnUI(_ button : [UIButton]!) {
        for button in hashTagBtns {
            button.layer.cornerRadius = 13
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
        }
    }
    
    @IBAction func downkeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    // 아래 둘은 들어간 함수는 같은데 이벤트가 다르다. 어떻게 통일시키지..
    @IBAction func searchWords(_ sender: UIButton) {
        searchNewWords(textField)
        view.endEditing(true)
    }
    
    @IBAction func enterExitKeyboard(_ sender: UITextField) {
        searchNewWords(textField)
        textField.endEditing(true)
    }
}
