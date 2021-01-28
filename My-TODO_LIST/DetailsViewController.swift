//
//  Details.swift
//  My-TODO_List
//
//  Created by 濱貴大 on 2021/01/17.
//

import UIKit

var DetailsText = [String]()

class DetailsViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var TextDetails: UITextView!
    
    
    @IBAction func DetailsAdd(_ sender: Any) {
        
        DetailsText.append(TextDetails.text!)
        
        //追加ボタンを押したらフィールドを空にする
        TextDetails.text = ""
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        TextDetails.text = ""
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TextDetails.text = textField.text
        
        textField.resignFirstResponder()
        return true
        
        
        
    }
    
}
