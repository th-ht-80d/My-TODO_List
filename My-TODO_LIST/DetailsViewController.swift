//
//  Details.swift
//  My-TODO_List
//
//  Created by 濱貴大 on 2021/01/17.
//

import UIKit

class DetailsViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var TextDetailstableView: UITextView!
    // テーブルに表示するデータの箱
    var textDetails = [String]()
    // UserDefaultsのインスタンスの生成
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextDetailstableView.backgroundColor = UIColor.white // 白
        
        // データ読み込み
        if let storedTodoList = userDefaults.array(forKey: "textDetails") as? [String] {
            textDetails.append(contentsOf: storedTodoList)
            
            TextDetailstableView.text = ""
            // 追加した内容を保存
            self.userDefaults.set(self.textDetails, forKey: "textDetails")
            
        }
    }
    
}
