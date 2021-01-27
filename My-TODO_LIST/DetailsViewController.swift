//
//  Details.swift
//  My-TODO_List
//
//  Created by 濱貴大 on 2021/01/17.
//

import UIKit


class DetailsViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var TextDetails: UITextView!
    
    
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
