import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // テーブルに表示するデータの箱
    var todoList = [String?]()
    // UserDefaultsのインスタンスの生成
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // データ読み込み
        if let storedTodoList = userDefaults.array(forKey: "todoList") as? [String] {
            todoList.append(contentsOf: storedTodoList)
        }
    }
    
    @IBAction func didTopTodoAddButton(_ sender: UIBarButtonItem) {
        
        
        let alertController = UIAlertController(title: "TODOリスト追加", message: "今日は何をしますか？", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            //OKをタップした時の処理
            if let textField = alertController.textFields?.first {
                self.todoList.insert(textField.text, at: 0) //！削除
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
                
                // 追加した内容を保存
                self.userDefaults.set(self.todoList, forKey: "todoList")
            }
        }
        alertController.addAction(okAction)
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    
    // セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    // セルの中身を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        let todoTitle = todoList[indexPath.row]
        cell.textLabel?.text = todoTitle
        return cell
    }
    
    // セルの削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            // 削除した内容を保存
            userDefaults.set(todoList, forKey: "todoList")
        }
    }
}